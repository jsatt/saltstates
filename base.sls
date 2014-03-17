/etc/salt/minion:
    file.managed:
        - source: salt://configs/salt/minion

remove_bloat:
    pkg.purged:
        - names:
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
utils:
    pkg.installed:
        - pkgs:
            - curl
            - firefox
            - firefox-globalmenu
            - htop
            - ia32-libs  # for emusisdlm, maybe others
            - screen
            - ssh
            - synaptic
            - terminator
            - thunderbird
            - vim
        - required:
            - pkg.removed: remove_bloat

# vim:set ft=yaml:
