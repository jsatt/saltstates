firefox:
    pkgrepo.managed:
        - ppa: ubuntu-mozilla-security/ppa
        - require_in:
            - pkg: firefox
    pkg.installed:
        - pkgs:
            - firefox
            - firefox-globalmenu
        - require:
            - pkgrepo: firefox

# vim:set ft=yaml:
