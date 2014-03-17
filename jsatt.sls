jsatt:
    user.present:
        - groups:
            - jsatt
            - adm
            - lpadmin
            - sudo
            - vboxusers
            - wheel
            - www-data

jsatt-dotfiles:
    git.latest:
        - name: git@github.com:jsatt/dotfiles.git
        - target: /home/jsatt/.dotfiles
        - runas: jsatt
        - require:
            - user: jsatt
    cmd.wait:
        - name: /home/jsatt/.dotfiles/setupdotfiles
        - watch:
            - git: jsatt-dotfiles

# vim:set ft=yaml:
