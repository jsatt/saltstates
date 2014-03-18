google-talkplugin:
    pkgrepo.managed:
        - name: deb http://dl.google.com/linux/talkplugin/deb/ stable main
        - file: /etc/apt/sources.list.d/googletalkplugin.list
        - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
        - require_in:
            - pkg: google-talkplugin
    pkg.installed:
        - require:
            - pkgrepo: google-talkplugin

