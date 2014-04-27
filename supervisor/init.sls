supervisor:
    pkg:
        - installed
    service:
        - running

restart_supervisor:
    cmd.wait:
        - name: service supervisor stop && service supervisor start
