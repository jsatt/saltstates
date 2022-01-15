{% set sonarr = salt['pillar.get']('sonarr', {}) -%}
include:
  - docker

sonarr:
  docker_container.running:
    - image: linuxserver/sonarr
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - '{{ sonarr.config_path }}:/config'
      - '{{ sonarr.media_path }}:/downloads'
      {%- for path in sonarr.get('extra_binds', []) %}
      - '{{ path }}'{% endfor %}
    - environment:
      - PUID: {{ sonarr.get('uid', '1000') }}
      - PGID: {{ sonarr.get('gid', '1000') }}
      - TZ: {{ sonarr.get('timezone', 'UTC') }}
