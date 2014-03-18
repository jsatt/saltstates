#/etc/minidlna.conf:
#    file.managed:
#        - source: salt://etc/minidlna.conf

#minidlna:
#    pkg:
#        - installed
#        - require:
#            - file: /etc/minidlna.conf
#    service:
#        - running
#        - watch:
#            - file: /etc/minidlna.conf

#/etc/ufw/applications.d/minidlna:
#    file.managed:
#        - source: salt://etc/ufw/applications.d/minidlna

