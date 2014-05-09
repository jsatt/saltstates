include:
    - supervisor

rygel:
    pkg.installed:
        - pkgs:
            - rygel
        - require:
            - file: rygel
    file.managed:
        - name: /etc/rygel.conf
        - source: salt://rygel/rygel.conf
        - template: jinja

rygel_supervisor:
    file.managed:
        - name: /etc/supervisor/conf.d/rygel.conf
        - source: salt://rygel/supervisor.conf
        - mode: 0644
        - template: jinja
        - require:
            - pkg: supervisor
        - watch_in:
            - service: supervisor
            - cmd: restart_supervisor

    cmd.wait:
        - name: supervisorctl stop rygel && supervisorctl start rygel
        - watch:
            - file: rygel
