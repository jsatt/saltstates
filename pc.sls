apps:
    pkg.installed:
        - pkgs:
            - congruity
            - gimp
            - konversation
            - pidgin
            - qgis
            - transmission
            - firefox
            - firefox-globalmenu
            - ia32-libs  # for emusisdlm, maybe others
            - synaptic
            - terminator
            - thunderbird
        - require:
            - pkg: remove_bloat

remove_bloat:
    pkg.purged:
        - pkgs:
            - akregator
            - bluedevil
            - dragonplayer
            - kaddressbook
            - kamoso
            - kexi
            - kmail
            - knotes
            - kontact
            - korganizer
            - kpat
            - kppp
            - krdc
            - krita
            - krita-data
            - ktorrent
            - kubuntu-firefox-installer
            - muon
            - muon-installer
            - muon-notifier
            - muon-updater
            - quassel
            - rdesktop
            - xterm

media_apps:
    pkg.installed:
        - pkgs:
            - easytag
            - ubuntu-restricted-extras
            - vlc
            - amarok

dropbox:
    pkgrepo.managed:
        - name: deb http://linux.dropbox.com/ubuntu {{salt['grains.get']('oscodename', 'raring')}} main
        - keyserver: pgp.mit.edu
        - keyid: 5044912E
        - file: /etc/apt/sources.list.d/dropbox.list
        - require_in:
            - pkg: dropbox
    pkg.installed:
        - require:
            - pkgrepo: dropbox

google-chrome:
    pkgrepo.managed:
        - name: deb http://dl.google.com/linux/chrome/deb/ stable main
        - file: /etc/apt/sources.list.d/google-chrome.list
        - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
        - require_in:
            - pkg: google-chrome
    pkg.installed:
        - name: google-chrome-stable
        - require:
            - pkgrepo: google-chrome

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

libreoffice:
    pkgrepo.managed:
        - ppa: libreoffice/ppa
        - require_in:
            - pkg: libreoffice
    pkg.installed:
        - require:
            - pkgrepo: libreoffice

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

wine:
    pkgrepo.managed:
        - ppa: ubuntu-wine/ppa
        - require_in:
            - pkg: wine
    pkg.installed:
        - name: wine
        - require:
            - pkgrepo: wine

# vim:set ft=yaml:
