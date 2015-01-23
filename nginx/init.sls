nginx:
    pkgrepo.managed:
        - ppa: nginx/stable 
        - require_in:
            - pkg: nginx
    pkg.installed:
        - require:
            - pkgrepo: nginx
    service:
        - running
        - watch:
            - file: /etc/nginx/sites-available/default

/etc/nginx/sites-available/default:
    file.managed:
        - source: salt://nginx/site-default
        - require:
            - pkg: nginx

# vim:set ft=yaml:
