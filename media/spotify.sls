spotify:
    pkgrepo.managed:
        - name: deb http://repository.spotify.com stable non-free
        - key_url: https://download.spotify.com/debian/pubkey.gpg
        - file: /etc/apt/sources.list.d/spotify.list
        - require_in:
            - pkg: spotify
    pkg.installed:
        - name: spotify-client
        - require:
            - pkgrepo: spotify

