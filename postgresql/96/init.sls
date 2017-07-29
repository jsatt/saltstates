
postgresql:
    pkgrepo.managed:
        - name: deb http://apt.postgresql.org/pub/repos/apt/ {{salt['grains.get']('oscodename', 'zesty')}}-pgdg main
        - file: /etc/apt/sources.list.d/postgresql.list
        - key_url: http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc
        - require_in:
            - pkg: postgresql
    pkg.installed:
        - names:
            - postgresql-contrib
            - postgresql-9.6-postgis-2.3
            - pgadmin3
            - postgresql-client
        - require:
            - pkgrepo: postgresql

/home/sys/postgresql/:
    file.directory:
        - user: postgres
        - group: postgres
        - dir_mode: 2700
        - file_mode: 600
        - makedirs: True
        - recurse:
            - user
            - group
            - mode
        - require:
            - pkg: postgresql

/var/run/postgresql/:
    file.directory:
        - user: postgres
        - group: postgres
        - mode: 2775
        - makedirs: True
        - require:
            - pkg: postgresql

move_postgres_data:
    file.managed:
        - name: /etc/postgresql/9.6/main/postgresql.conf
        - source: salt://postgresql/96/postgresql.conf
        - require:
            - pkg: postgresql
        - mode: 755
        - makedirs: True
    cmd.wait:
        - name: service postgresql stop && service postgresql start
        - watch:
            - file: move_postgres_data

postgresql_running:
    service:
        - name: postgresql
        - running
        - reload: True
        - require:
            - pkg: postgresql
            - file: /etc/postgresql/9.6/main/postgresql.conf
        - watch:
            - file: /etc/postgresql/9.6/main/postgresql.conf

{% for username, user in pillar.postgres.users.items() %}
pg_user-{{username}}:
    postgres_user.present:
        - name: {{username}}
        - password: {{user.password}}
        - encrypted: True
        - superuser: {{user.get('superuser', False)}}
        - user: postgres
{% endfor %}

# vim:set ft=yaml:
