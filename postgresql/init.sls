postgresql:
    pkgrepo.managed:
        - name: deb http://apt.postgresql.org/pub/repos/apt/ {{salt['grains.get']('oscodename', 'utopic')}}-pgdg main
        - file: /etc/apt/sources.list.d/postgresql.list
        - key_url: http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc
        - require_in:
            - pkg: postgresql
    pkg.installed:
        - names:
            - postgresql-contrib
            - postgresql-9.4-postgis-2.2
            - postgresql-server-dev-9.3
        - require:
            - pkgrepo: postgresql
    service.running:
        - reload: True
        - require:
            - pkg: postgresql

{% for username, user in pillar.postgres.users.items() %}
pg_user-{{username}}:
    postgres_user.present:
        - name: {{username}}
        - password: {{user.password}}
        - encrypted: True
        - superuser: {{user.get('superuser', False)}}
        - runas: postgres
{% endfor %}

{% for db_name, db in pillar.postgres.schemas.items() %}
pg_db-{{db_name}}:
    postgres_database.present:
        - name: {{db_name}}
        - owner: {{db.owner}}
        - runas: postgres
        - require:
            - postgres_user: pg_user-{{db.owner}}
{% endfor %}

# vim:set ft=yaml:
