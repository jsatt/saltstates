owncloud:
    pkgrepo.managed:
        - name: deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_18.04/ /
        - file: /etc/apt/sources.list.d/owncloud.list
        - key_url: https://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_18.04/Release.key
    pkg.installed:
        - name: owncloud-client
        - require:
            - pkgrepo: owncloud
