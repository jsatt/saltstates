nginx:
    pkgrepo.managed:
        - ppa: nginx/stable
        - required_in:
            - pkg: nginx
    pkg.installed:
        - require:
            - pkgrepo: nginx
    service.running:
        - require:
            - file: /etc/nginx/nginx.conf
            - file: /etc/nginx/mime.types
        - watch:
            - file: /etc/nginx/nginx.conf
            - file: /etc/nginx/mime.types
            - file: nginx
    file.absent:
        - name: /etc/nginx/sites-enabled/default

/etc/nginx/nginx.conf:
    file.managed:
        - source: salt://nginx/nginx.conf
        - template: jinja
        - require:
            - pkg: nginx

/etc/nginx/mime.types:
    file.managed:
        - source: salt://nginx/mime.types
        - template: jinja
        - require:
            - pkg: nginx

/etc/nginx/ssl:
    file.directory:
        - user: www-data
        - group: www-data
        - mode: 700
        - file_mode: 600
        - recurse:
            - user
            - group
            - mode

# vim:set ft=yaml: