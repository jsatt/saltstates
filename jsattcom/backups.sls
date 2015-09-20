include:
    - aws
    - postgresql

/var/lib/postgresql/.aws:
    file.directory:
        - mode: 770
        - user: postgres
        - group: postgres
        - require:
            - sls: aws
            - sls: postgresql

/var/lib/postgresql/.aws/config:
    file.managed:
        - source: salt://aws/aws_config
        - mode: 600
        - user: postgres
        - group: postgres
        - makedirs: True
        - require:
            - file: /var/lib/postgresql/.aws

/var/lib/postgresql/.aws/credentials:
    file.managed:
        - source: salt://aws/aws_credentials
        - template: jinja
        - mode: 600
        - user: postgres
        - group: postgres
        - makedirs: True
        - require:
            - file: /var/lib/postgresql/.aws

/var/lib/postgresql/dbbackup.sh:
    file.managed:
        - source: salt://jsattcom/dbbackup.sh
        - template: jinja
        - mode: 700
        - user: postgres
        - group: postgres
    cron.present:
        - user: postgres
        - minute: 0
        - hour: 7
        - require:
            - file: /var/lib/postgresql/dbbackup.sh
            - file: /var/lib/postgresql/.aws/credentials
            - file: /var/lib/postgresql/.aws/config
            - sls: postgresql
