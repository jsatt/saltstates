S27A850T_xorg:
    file.managed:
        - name: /etc/X11/xorg.conf
        - source: salt://system/S27A850T_xorg.conf
        - mode: 644
        - user: root
        - group: root
