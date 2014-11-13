hipchat:
    pkgrepo.managed:
        - name: deb http://downloads.hipchat.com/linux/apt stable main
        - file: /etc/apt/sources.list.d/hipchat.list
        - key_url: https://www.hipchat.com/keys/hipchat-linux.key
        - require_in:
            - pkg: hipchat
    pkg.installed:
        - name: hipchat
        - require:
            - pkgrepo: hipchat
