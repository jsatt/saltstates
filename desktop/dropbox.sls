dropbox:
    pkgrepo.managed:
        - name: deb http://linux.dropbox.com/ubuntu {{salt['grains.get']('oscodename', 'utopic')}} main
        - keyserver: pgp.mit.edu
        - keyid: 5044912E
        - file: /etc/apt/sources.list.d/dropbox.list
        - require_in:
            - pkg: dropbox
    pkg.installed:
        - require:
            - pkgrepo: dropbox
