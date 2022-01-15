{% set plex = salt['pillar.get']('plex', {}) -%}
include:
  - docker

plex:
  docker_container.running:
    - image: linuxserver/plex
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - '{{ plex.config_path }}:/config'
      - '{{ plex.media_path }}:/media'
      {%- for path in plex.get('extra_binds', []) %}
      - '{{ path }}'{% endfor %}
    - environment:
      - PUID: {{ plex.get('uid', '1000') }}
      - PGID: {{ plex.get('gid', '1000') }}
      - TZ: {{ plex.get('timezone', 'UTC') }}
      {%- if plex.get('enable_nvidia_support', False) %}
      - NVIDIA_VISIBLE_DEVICES: all{% endif %}
      {%- if plex.get('claim_token', None) %}
      - PLEX_CLAIM: {{ plex.claim_token }}{% endif %}
