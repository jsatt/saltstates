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
{% endfor %}

# vim:set ft=yaml:
