nextcloud:
    pkgrepo.managed:
        - ppa: nextcloud-devs/client
    pkg.installed:
        - name: nextcloud-client
        - require:
            - pkgrepo: nextcloud

