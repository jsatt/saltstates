nginx:
    pkgrepo.managed:
        - ppa: nginx/stable 
        - required_in:
            - pkg: nginx
    pkg.installed:
        - require:
            - pkgrepo: nginx
    service:
        - running
        - watch:
            - file: /etc/nginx/sites-available/default
    file.managed:
        - name: /etc/nginx/sites-available/default
        - source: salt://etc/nginx/sites-available/default
        - template: jinja
        - require:
            - pkg: nginx

# vim:set ft=yaml:
