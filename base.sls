/etc/salt/minion:
    file.managed:
        - source: salt://salt/minion

utils:
    pkg.installed:
        - pkgs:
            - build-essential
            - python-software-properties
            - curl
            - htop
            - screen
            - ssh
            - vim
            - vim-gui-common
            - zsh

# vim:set ft=yaml:
