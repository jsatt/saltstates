supervisor:
    pkg.installed: []
    service.running:
        - watch:
            - file: supervisor
