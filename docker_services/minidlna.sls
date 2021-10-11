{% set minidlna = salt['pillar.get']('minidlna', {}) -%}
include:
  - docker

minidlna:
  docker_container.running:
    - image: vladgh/minidlna
    - detach: True
    - restart_policy: always
    - networks:
      - host
    - binds:
      - {{ minidlna.get('media_path') }}:/media
      - {{minidlna.get('cache_path') }}:/cache
      {%- for bind in minidlna.get('extra_binds', []) %}
      - {{bind}} {% endfor %}
    - environment:
      - MINIDLNA_MEDIA_DIR: /media
      - MINIDLNA_FRIENDLY_NAME: {{ minidlna.get('friendly_name', salt['grains.get']('host', 'MiniDLNA')) }}
      - MINIDLNA_DB_DIR: /cache
    - require:
      - sls: docker
