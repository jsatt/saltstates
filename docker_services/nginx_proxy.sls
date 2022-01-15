{% set revproxy = salt['pillar.get']('nginx_revproxy', {}) -%}
include:
  - docker

nginx_revproxy:
  docker_container.running:
    - image: linuxserver/swag
    - detach: true
    - restart_policy: always
    - network_mode: host
    - binds:
      - {{ revproxy.config_path }}:/config
      - {{ revproxy.cache_path }}:/var/cache/nginx
      - {{ revproxy.run_path }}:/var/run
    - environment:
      {%- for key, val in revproxy.get('env', {}).items() %}
      - {{ key }}: '{{ val }}'{% endfor %}
