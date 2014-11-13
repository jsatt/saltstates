openvpn:
    pkg:
        - installed
    service:
        - running

reload_openvpn:
    cmd.wait:
        - name: service openvpn stop && service openvpn start

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
        - watched_in:
            - cmd: reload_openvpn
{% endfor %}

# vim:set ft=yaml:
