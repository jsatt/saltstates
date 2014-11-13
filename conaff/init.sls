include:
    - openvpn
    - python.pil_deps

# nltk
/usr/share/nltk_data:
    file.symlink:
        - target: /home/jsatt/.nltk_data

# nginx
/var/www/conaff/files:
    file.directory:
        - user: www-data
        - group: www-data
        - mode: 775
        - makedirs: True

/etc/nginx/sites-available/conaff:
    file.managed:
        - source: salt://conaff/site-conaff
        - require:
            - pkg: nginx

/etc/nginx/sites-enabled/conaff:
    file.symlink:
        - target: /etc/nginx/sites-available/conaff
        - require:
            - file: /etc/nginx/sites-available/conaff

# hosts
conaff:
    host.present:
        - ip: 127.0.2.1
        - names: [conaff, conaff.com]

{% for hostname, host in pillar.conaff.hosts.items() %}
{{hostname}}:
    host.present:
        - ip: {{host['ip']}}
        {% if host.get('names', '') %}- names: {{host['names']}}{% endif %}
{% endfor %}

# vim:set ft=yaml:
