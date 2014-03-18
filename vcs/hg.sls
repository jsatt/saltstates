mercurial:
    pkgrepo.managed:
        - ppa: mercurial-ppa/releases
        - require_in:
            - pkg: mercurial
    pkg.installed:
        - require:
            - pkgrepo: mercurial

tortoisehg:
    pkgrepo.managed:
        - ppa: tortoisehg-ppa/releases
        - require_in:
            - pkg: tortoisehg
    pkg.installed:
        - require:
            - pkgrepo: tortoisehg

# vim:set ft=yaml:
