{% set flexget = salt['pillar.get']('flexget', {}) -%}
flexget:
  file.directory:
    - name: {{ flexget.get('config_dir', '/etc/flexget') }} 
    - user: 1000
  docker_container.running:
    - image: wiserain/flexget
    - detach: True
    - restart_policy: always
    - networks:
      - internal
    - port_bindings:
      - {{ flexget.get('port', '5050') }}:5050
    - binds:
      - {{ flexget.get('config_dir', '/etc/flexget') }}:/config:rw
      - {{ flexget.get('data_dir', '/data') }}:/data:rw
    - environment:
      - TZ: {{salt['timezone.get_zone']()}}
      - FG_WEBUI_PASSWD: TJaEjkzb5UFysDeN
      {% if 'uid' in flexget -%}
      - PUID: {{ flexget.uid }}
      {% elif 'user' in flexget -%}
      - PUID: {{ salt['cmd.run']('id -u {}'.format(flexget.user)) }}
      {% else %}
      - PUID: 1000
      {% endif -%}
      {% if 'gid' in flexget -%}
      - PGID: {{ flexget.gid }}
      {% elif 'group' in flexget -%}
      - PGID: {{ salt['cmd.run']('id -g {}'.format(flexget.group)) }}
      {% else %}
      - PGID: 1000
      {% endif -%}
    - require:
      - sls: docker
