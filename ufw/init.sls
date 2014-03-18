ufw:
    pkg:
        - installed
    service:
        - running
        - watch:
            - file: /etc/ufw/ufw.conf
            - file: /lib/ufw/user.rules

/etc/ufw/ufw.conf:
    file.managed:
        - source: salt://etc/ufw/ufw.conf
        - require:
            - pkg: ufw

/lib/ufw/user.rules:
    file.managed:
        - source: salt://lib/ufw/user.rules
        - require:
            - pkg: ufw

# vim: set filetype=yaml:
