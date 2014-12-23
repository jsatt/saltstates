/etc/mysql/my.cnf:
    file.managed:
        - source: salt://mysql/my.cnf

/etc/apparmor.d/usr.sbin.mysqld:
    file.managed:
        - source: salt://mysql/apparmor
        - require:
            - file: /etc/mysql/my.cnf

mysql:
    pkg.installed:
        - name: mysql-server
        - require:
            - file: /etc/mysql/my.cnf
    service:
        - running
        - require:
            - pkg: mysql
            - file: /home/mysql
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
            - python-mysqldb
            #- mysql-admin
            #- mysql-query-browser
        - require:
            - pkg: mysql


{% for username, user in pillar.mysql.users.items() %}
{% for host in user.hosts %}
mysql_user-{{username}}-{{host}}:
    mysql_user.present:
        - name: {{username}}
        - password: "{{user.password}}"
        - require:
            - pkg: mysql-utils
            - service: mysql

{% for database in user.get('databases', []) %}
mysql_user-{{username}}-{{host}}-{{database}}:
    mysql_grants.present:
        - grant: {{user.grant}}
        - database: "'{{database}}'"
        - user: {{username}}
        - host: "{{host}}"
        - require:
            - mysql_user: mysql_user-{{username}}-{{host}}
{% endfor %}
{% endfor %}
{% endfor %}

# vim:set ft=yaml:
