google-musicmanager-beta:
    pkgrepo.managed:
        - name: deb http://dl.google.com/linux/musicmanager/deb/ stable main
        - file: /etc/apt/sources.list.d/musicmanager.list
        - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
        - require_in:
            - pkg: google-musicmanager-beta
    pkg.installed:
        - require:
            - pkgrepo: google-musicmanager-beta

