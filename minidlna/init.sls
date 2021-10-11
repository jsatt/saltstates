/etc/minidlna.conf:
    file.managed:
        - source: salt://minidlna/minidlna.conf
        - template: jinja

minidlna:
    pkg:
        - installed
        - require:
            - file: /etc/minidlna.conf
    service:
        - running
        - require:
            - pkg: minidlna
        - watch:
            - file: /etc/minidlna.conf

/home/media:
    file.directory:
        - mode: 777
        - makedirs: True
