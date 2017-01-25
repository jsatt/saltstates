openvpn:
    pkg.installed: []
    service.running: []

{% for name, client in salt['pillar.get']('openvpn', {}).get('clients').items() %}
ovpn_{{name}}:
    file.managed:
        - name: /etc/openvpn/{{ name }}.conf
        - source: salt://openvpn/client.conf
        - template: jinja
        - defaults:
            vpn_hostname: {{ client.hostname }}
            vpn_port: {{ client.get('port', 1194) }}
            ca_crt: {{ client.get('ca_crt') }}
            client_crt: {{ client.get('client_crt') }}
            client_key: {{ client.get('client_key') }}
            cipher: {{ client.get('cipher') }}
        - watch_in:
            - service: openvpn
{% endfor %}

# vim:set ft=yaml:
