transmission-daemon:
    pkg:
        - installed
    service:
        - running
        - watch:
            - file: /etc/transmission-daemon/settings.json

/var/lib/transmission-daemon/:
    file.directory:
        - user: debian-transmission
        - group: debian-transmission
        - recurse:
            - user
            - group
        - require:
            - pkg.installed: transmission-daemon

/etc/transmission-daemon/:
    file.directory:
        - user: debian-transmission
        - group: debian-transmission
        - recurse:
            - user
            - group
        - require:
            - pkg.installed: transmission-daemon

/etc/transmission-daemon/settings.json:
    file.managed:
        - source: salt://transmission/settings.json
        - template: jinja
        - user: debian-transmission
        - group: debian-transmission
        - mode: 600


# vim:set ft=yaml:
