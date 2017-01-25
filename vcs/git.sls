git:
    pkgrepo.managed:
        - ppa: git-core/ppa
    pkg.installed:
        - pkgs:
            - git
            - gitk
            - git-gui
        - require:
            - pkgrepo: git

# vim:set ft=yaml:
