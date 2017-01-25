jsatt-dotfiles:
    git.latest:
        - name: https://github.com/jsatt/dotfiles.git
        - rev: master
        - target: /home/jsatt/.dotfiles
        - user: jsatt
    cmd.wait:
        - name: /home/jsatt/.dotfiles/setupdotfiles
        - runas: jsatt
        - watch:
            - git: jsatt-dotfiles

# vim:set ft=yaml:
