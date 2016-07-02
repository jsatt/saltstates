python:
    pkg.installed:
        - pkgs:
            - python
            - python-pip
            - python-all-dev
            - python-setuptools
            - python3
            - python3-pip
            - python3-all-dev
            - python3-setuptools
    pip.installed:
        - names:
            - virtualenvwrapper
        - require:
            - pkg: python

# vim:set ft=yaml:
