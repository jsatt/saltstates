openvpn:
    pkg.installed: []
    #service.running:
        #- name: openvpn.service

{%- for name, client in salt['pillar.get']('openvpn', {}).get('clients', {}).items() %}
{%- if client.user_pass %}
ovpn_{{name}}_auth:
  file.managed:
    - name: /etc/openvpn/{{name}}.auth
    - contents_pillar: openvpn:clients:{{name}}:user_pass
    - mode: 600
    - watch_in:
      - service: openvpn
{%- endif %}

ovpn_{{name}}:
  file.managed:
    - name: /etc/openvpn/{{ name }}.conf
    - contents_pillar: openvpn:clients:{{name}}:conf
    - template: jinja
    - defaults:
        {%- if client.user_pass %}
        user_pass_path: /etc/openvpn/{{name}}.auth
        {%- endif %}
    - watch_in:
      - service: openvpn
  service.running:
    - name: openvpn@{{name}}

ovpn_{{name}}_upscript:
  file.managed:
    - name: /etc/NetworkManager/dispatcher.d/pre-up.d/fix_route_{{ name }}.sh
    - mode: 755
    - contents: |
        #!/bin/bash
        if [[ "$2" == "vpn-pre-up" ]]
        then
          ip rule add from 192.168.1.159 table 10
          ip route add table 10 to 192.168.1.0/24 dev enp3s0
          ip route add table 10 default via 192.168.1.1
        fi

ovpn_{{name}}_downscript:
  file.managed:
    - name: /etc/NetworkManager/dispatcher.d/pre-down.d/reset_route_{{ name }}.sh
    - mode: 755
    - contents: |
        #!/bin/bash
        if [[ "$2" == "vpn-pre-down" ]]
        then
          ip rule del from 192.168.1.159 table 10
          ip route del table 10 to 192.168.1.0/24 dev enp3s0
          ip route del table 10 default via 192.168.1.1
        fi
{% endfor %}

{%- for name, client in salt['pillar.get']('openvpn', {}).get('deprecated', {}).items() %}
{%- if client.user_pass %}
ovpn_{{name}}_auth:
  file.absent:
    - name: /etc/openvpn/{{name}}.auth
{%- endif %}

ovpn_{{name}}:
  file.absent:
    - name: /etc/openvpn/{{ name }}.conf
{% endfor %}

# vim:set ft=yaml:
