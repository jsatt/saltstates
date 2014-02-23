supervisor:
    pkg:
        - installed
    pip.installed:
        - name: gunicorn
    service:
        - running
        - watch:
            - file: supervisor
    file.managed:
        - name: /etc/supervisor/conf.d/mezzanine.conf
        - source: salt://etc/supervisor/conf.d/mezzanine.conf
        - mode: 644
        - require:
            - pkg: supervisor
            - pip: supervisor
    cmd.wait:
        - name: service supervisor stop && service supervisor start
        - watch:
            - file: supervisor
