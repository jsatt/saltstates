/etc/minidlna.conf:
    file.managed:
        - source: salt://minidlna/minidlna.conf

minidlna:
    pkg:
        - installed
        - require:
            - file: /etc/minidlna.conf
    service:
        - running
        - watch:
            - file: /etc/minidlna.conf

/home/media:
    file.directory:
        - mode: 777
        - makedirs: True

#/etc/ufw/applications.d/minidlna:
#    file.managed:
#        - source: salt://etc/ufw/applications.d/minidlna

