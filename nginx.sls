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
            - file: /etc/nginx/sites-available/*
            - file: /etc/nginx/sites-enabled/*

/etc/nginx/sites-available/default:
    file.managed:
        - source: salt://configs/nginx/site-default
        - require:
            - pkg: nginx

# vim:set ft=yaml:
