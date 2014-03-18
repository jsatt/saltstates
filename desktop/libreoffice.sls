libreoffice:
    pkgrepo.managed:
        - ppa: libreoffice/ppa
        - require_in:
            - pkg: libreoffice
    pkg.installed:
        - require:
            - pkgrepo: libreoffice

