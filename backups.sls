include:
    - postgresql

amazons3:
    pkg.installed:
        - name: s3cmd
    file.managed:
        - name: /var/lib/postgresql/.s3cfg
        - source: salt://backups/s3cfg
        - user: postgres
        - mode: 0600
        - template: jinja
        - makedirs: True
        - require:
            - pkg: amazons3

database_backup_script:
    file.managed:
        - name: /var/lib/postgresql/db_backup_to_s3.sh
        - source: salt://backups/db_backup_to_s3.sh
        - user: postgres
        - mode: 0755
        - template: jinja
        - makedirs: True
        - require:
            - pkg: amazons3
            - pkg: postgresql
    cron.present:
        - name: /var/lib/postgresql/db_backup_to_s3.sh
        - user: postgres
        - minute: 0
        - hour: 7
        - require:
            - file: database_backup_script

