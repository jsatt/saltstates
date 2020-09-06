include:
  - python3
  - users

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

jsatt-powerline:
  pip.installed:
    - pkgs: 
      - powerline-status
    - user: jsatt
    - bin_env: /usr/bin/pip3
    - extra_args:
      - --user
  cmd.run:
    - name: powerline-config tmux setup
    - runas: jsatt
    - env:
      - LC_ALL: en_US.UTF-8  # handle unicode characters in powerline theme
    - onchanges:
      - pip: jsatt-powerline

# vim:set ft=yaml:
