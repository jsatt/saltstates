#rygel:
#    pkg.installed:
#        - pkgs:
#            - rygel
#            - rygel-gst-launch
#            - wavpack
#        - require:
#            - file: rygel
#   file.managed:
#        - name: /etc/rygel.conf
#        - source: salt://etc/rygel.conf

