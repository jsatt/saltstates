python:
    pkg.installed:
        - pkgs:
            - python
            - python-pip
            - python-dev
            - python-setuptools
    pip.installed:
        - names:
            - virtualenvwrapper
        - require:
            - pkg: python

# vim:set ft=yaml:
