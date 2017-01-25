include:
    - nginx

ops_dependencies:
    pkg.installed:
        - names:
            - postgresql-server-dev-9.4

/etc/nginx/sites-enabled/sk.com:
    file.managed:
        - source: salt://summit/sk-nginx
        - template: jinja
        - require:
            - pkg: nginx
        - watch_in:
            - service: nginx

/etc/nginx/sites-enabled/ops.sk.com:
    file.managed:
        - source: salt://summit/ops-nginx
        - template: jinja
        - require:
            - pkg: nginx
        - watch_in:
            - service: nginx

# vim:set ft=yaml:
