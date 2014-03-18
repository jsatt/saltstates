include: 
    - postgresql
    - python.pil_deps

healthgeist:
    postgres_database.present:
        - name: healthgeist
        - owner: django
        - require:
            - postgres_user: pg_user-django
    file.managed:
        - name: /usr/local/bin/setup_healthgeist_db_gis.sh
        - source: salt://heathgeist/setup_healthgeist_db_gis.sh
        - mode: 755
    cmd.wait:
        - name: /usr/local/bin/setup_healthgeist_db_gis.sh
        - user: postgres
        - watch:
            - postgres_database: healthgeist
        - require:
            - file: healthgeist

# vim:set ft=yaml:
