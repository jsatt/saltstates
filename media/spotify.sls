spotify:
    pkgrepo.managed:
        - name: deb http://repository.spotify.com stable non-free
        - keyserver: keyserver.ubuntu.com
        - keyid: 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
        - file: /etc/apt/sources.list.d/spotify.list
        - require_in:
            - pkg: spotify
    pkg.installed:
        - name: spotify-client
        - require:
            - pkgrepo: spotify

