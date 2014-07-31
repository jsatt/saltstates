/home/sys/postgresql/:
    file.directory:
        - user: postgres
        - group: postgres
        - mode: 700
        - makedirs: True


/var/run/postgresql/:
    file.directory:
        - user: postgres
        - group: postgres
        - mode: 2775
        - makedirs: True

postgresql:
    pkgrepo.managed:
        # contains Postgresql 9.3 and PostGIS 2.1
        - name: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
        - file: /etc/apt/sources.list.d/postgresql.list
        - key_url: http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc
        - require_in:
            - pkg: postgresql
    pkg.installed:
        - names:
            - postgresql-contrib
            - postgresql-9.3-postgis-2.1
            - pgadmin3
            - postgresql-client
        - require:
            - file: /home/sys/postgresql/
            - file: /var/run/postgresql/
            - pkgrepo: postgresql
    service:
        - name: postgresql
        - running
        - reload: True
        - require:
            - pkg: postgresql
            - file: /etc/postgresql/9.3/main/postgresql.conf
        - watch:
            - file: /etc/postgresql/9.3/main/postgresql.conf
    file.managed:
        - name: /etc/postgresql/9.3/main/postgresql.conf
        - source: salt://postgresql93/postgresql.conf
        - require:
            - pkg: postgresql
        - mode: 755

{% for username, user in pillar.postgres.users.items() %}
pg_user-{{username}}:
    postgres_user.present:
        - name: {{username}}
        - password: {{user.password}}
        - encrypted: True
        - superuser: {{user.get('superuser', False)}}
        - runas: postgres
{% endfor %}

# vim:set ft=yaml:
