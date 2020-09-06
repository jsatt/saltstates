python2:
    pkg.installed:
        - pkgs:
            - python
            - python-pip
            - python-all-dev
            - python-setuptools
    pip.installed:
        - names:
            - virtualenvwrapper
        - require:
            - pkg: python2

# vim:set ft=yaml:
