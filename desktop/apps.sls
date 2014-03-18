apps:
    pkg.installed:
        - pkgs:
            - congruity
            - exuberant-ctags
            - gimp
            - ia32-libs  # for emusisdlm, maybe others
            - kdiff3
            - konversation
            - pidgin
            - qgis
            - synaptic
            - terminator
            - thunderbird
            - transmission
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

# vim:set ft=yaml:
