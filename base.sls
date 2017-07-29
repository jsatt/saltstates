/etc/salt/minion:
    file.managed:
        - source: salt://salt/minion

utils:
    pkg.installed:
        - pkgs:
            - ack-grep
            - build-essential
            - python-software-properties
            - curl
            - htop
            - net-tools
            - screen
            - ssh
            - vim
            - vim-gui-common
            - zsh

# vim:set ft=yaml:
