/etc/salt/minion:
    file.managed:
        - source: salt://salt/minion

utils:
    pkg.installed:
        - pkgs:
            - build-essential
            - curl
            - htop
            - screen
            - ssh
            - vim

# vim:set ft=yaml:
