nclude:
    - salt

/etc/salt/minion:
    file.managed:
        - source: salt://salt/masterless-minion
