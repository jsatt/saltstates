/etc/salt/minion:
    file.managed:
        - source: salt://salt/minion

utils:
    pkg.installed:
        - pkgs:
            - curl
            - htop
            - screen
            - ssh
            - vim

# vim:set ft=yaml:
