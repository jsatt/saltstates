/etc/salt/minion:
    file.managed:
        - source: salt://etc/salt/minion

saltstack_ppa:
    pkgrepo.managed:
        - ppa: saltstack/salt

apps:
    pkg.installed:
        - pkgs:
            - htop
            - screen
            - ssh
            - vim

# vim:set ft=yaml:
