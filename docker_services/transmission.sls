{% set transmission = salt['pillar.get']('transmission', {}) -%}
include:
  - docker

transmission:
  docker_container.running:
    - image: linuxserver/transmission
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - {{transmission['download_dir']}}:/downloads
      {% if 'config_dir' in transmission -%}
      - {{transmission['config_dir']}}:/config {% endif %}
      {% if 'watch_dir' in transmission -%}
      - {{transmission['watch_dir']}}:/watch {% endif %}
    - environment:
      - PUID: '{{transmission.get("uid", 1000)}}'
      - PGID: '{{transmission.get("gid", 1000)}}'
      - TZ: {{transmission.get('timezone', 'UTC')}}
