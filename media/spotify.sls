spotify:
    pkgrepo.managed:
        - name: deb http://repository.spotify.com stable non-free
        - keyserver: keyserver.ubuntu.com
        - keyid: 94558F59
        - file: /etc/apt/sources.list.d/spotify.list
        - require_in:
            - pkg: spotify
    pkg.installed:
        - name: spotify-client
        - require:
            - pkgrepo: spotify

