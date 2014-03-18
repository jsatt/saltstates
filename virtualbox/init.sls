virtualbox:
    pkgrepo.managed:
        - name: deb http://download.virtualbox.org/virtualbox/debian {{salt['grains.get']('oscodename', 'raring')}} contrib non-free
        - key_url: http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
        - file: /etc/apt/sources.list.d/virtualbox.list
        - require_in:
            - pkg: virtualbox
    pkg.installed:
        - require:
            - pkgrepo: virtualbox

