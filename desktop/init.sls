include:
    - desktop.apps
    - desktop.dropbox
    - desktop.googletalk
    - desktop.libreoffice
    #- desktop.wine

{% if salt['grains.get']('manufacturer', '') == 'System76, Inc.' %}
system76:
    pkgrepo.managed:
        - ppa: system76-dev/stable
    pkg.installed:
        - names:
            - system76-driver
{% endif %}