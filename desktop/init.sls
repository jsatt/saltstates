include:
    - desktop.apps
    #- desktop.dropbox
    - desktop.nextcloud
    - desktop.libreoffice

{% if salt['grains.get']('manufacturer', '') == 'System76, Inc.' %}
system76:
    pkgrepo.managed:
        - ppa: system76-dev/stable
    pkg.installed:
        - names:
            - system76-driver
{% endif %}
