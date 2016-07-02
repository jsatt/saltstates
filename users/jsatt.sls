jsatt-dotfiles:
    git.latest:
        - name: https://github.com/jsatt/dotfiles.git
        - target: /home/jsatt/.dotfiles
        - user: jsatt
    cmd.wait:
        - name: /home/jsatt/.dotfiles/setupdotfiles
        - user: jsatt
        - watch:
            - git: jsatt-dotfiles

# vim:set ft=yaml:
