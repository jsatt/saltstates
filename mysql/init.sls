{% set mysql_pillar = pillar.get('mysql', {}) %}
{% set datadir = mysql_pillar.get('config', {}).get('datadir', '/var/lib/mysql') %}
/etc/mysql/my.cnf:
    file.managed:
        - source: salt://mysql/my.cnf
        - template: jinja

/etc/apparmor.d/usr.sbin.mysqld:
    file.managed:
        - source: salt://mysql/apparmor
        - template: jinja
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
            - file: mysql
        - watch:
            - file: /etc/mysql/my.cnf
    file.directory:
        - name: {{datadir}}
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


{% for database in mysql_pillar.get('databases', []) %}
mysql_db-{{database}}:
    mysql_database.present:
        - name: {{database}}
{% endfor %}


{% for username, user in mysql_pillar.get('users', {}).items() %}
{% for host in user.hosts %}
mysql_user-{{username}}-{{host}}:
    mysql_user.present:
        - name: {{username}}
        - password: "{{user.password}}"
        - require:
            - pkg: mysql-utils
            - service: mysql

{% for db in user.get('databases', []) %}
mysql_user-{{username}}-{{host}}-{{db['database']}}:
    mysql_grants.present:
        - database: "{{db['database']}}.{{db.get('table', '*')}}"
        - grant: {{db.get('grants', ['all privileges'])|join(',')}}
        - user: {{username}}
        - host: "{{host}}"
        - require:
            - mysql_user: mysql_user-{{username}}-{{host}}
{% endfor %}
{% endfor %}
{% endfor %}

# vim:set ft=yaml:
