wine:
    pkgrepo.managed:
        - ppa: ubuntu-wine/ppa
        - require_in:
            - pkg: wine
    pkg.installed:
        - name: wine
        - require:
            - pkgrepo: wine

