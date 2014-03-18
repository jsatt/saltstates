/etc/mysql/my.cnf:
    file.managed:
        - source: salt://configs/mysql/my.cnf

/etc/apparmor.d/usr.sbin.mysqld:
    file.managed:
        - source: salt://configs/mysql/apparmor
        - require:
            - file: /etc/mysql/my.cnf

mysql:
    pkg.installed:
        - name: mysql-server
        - require:
            - file: /etc/mysql/my.cnf
    service:
        - running
        - watch:
            - file: /etc/mysql/my.cnf

/home/mysql:
    file.directory:
        - user: mysql
        - group: mysql
        - mode: 700
        - makedirs: True

mysql-utils:
    pkg.installed:
        - names:
            - libmysqlclient-dev
            - mysql-client
            - mysql-workbench
            #- mysql-admin
            #- mysql-query-browser
        - require:
            - pkg: mysql


# vim:set ft=yaml:
