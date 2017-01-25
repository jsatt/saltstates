virtualbox:
    pkgrepo.managed:
        - name: deb http://download.virtualbox.org/virtualbox/debian {{salt['grains.get']('oscodename', 'utopic')}} contrib non-free
        - key_url: http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc
        - file: /etc/apt/sources.list.d/virtualbox.list
        - require_in:
            - pkg: virtualbox
    pkg.installed:
        - require:
            - pkgrepo: virtualbox

