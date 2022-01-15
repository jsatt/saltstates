{% set prowlarr = salt['pillar.get']('prowlarr', {}) -%}
include:
  - docker

prowlarr:
  docker_container.running:
    - image: linuxserver/prowlarr:develop
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - '{{ prowlarr.config_path }}:/config'
    - environment:
      - PUID: {{ prowlarr.get('uid', '1000') }}
      - PGID: {{ prowlarr.get('gid', '1000') }}
      - TZ: {{ prowlarr.get('timezone', 'UTC') }}
