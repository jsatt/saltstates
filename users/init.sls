wheel:
    group.present

/etc/sudoers:
    file.append:
        - text: |
            %wheel ALL=(ALL) NOPASSWD:ALL

include:
    - users.jsatt

# vim:set ft=yaml:
