apps:
    pkg.installed:
        - pkgs:
            - exuberant-ctags
            - gimp
            - kdiff3
            - qps
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
            - thunderbird

# vim:set ft=yaml:
