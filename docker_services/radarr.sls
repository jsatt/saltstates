{% set radarr = salt['pillar.get']('radarr', {}) -%}
include:
  - docker

radarr:
  docker_container.running:
    - image: linuxserver/radarr
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - '{{ radarr.config_path }}:/config'
      - '{{ radarr.media_path }}:/downloads'
      {%- for path in radarr.get('extra_binds', []) %}
      - '{{ path }}'{% endfor %}
    - environment:
      - PUID: {{ radarr.get('uid', '1000') }}
      - PGID: {{ radarr.get('gid', '1000') }}
      - TZ: {{ radarr.get('timezone', 'UTC') }}
