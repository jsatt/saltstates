apps:
    pkg.installed:
        - pkgs:
            - congruity
            - exuberant-ctags
            - gimp
            - kdiff3
            - konversation
            - qgis
            - synaptic
            - terminator
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

media_apps:
    pkg.installed:
        - pkgs:
            - easytag
            - ubuntu-restricted-extras
            - vlc
            - amarok

# vim:set ft=yaml: