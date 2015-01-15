postgres:
    users:
        django:
            password: <<password>>
        jsatt:
            password: <<password>>
            superuser: True

mysql:
    config:
        datadir: /home/sys/mysql  # remove if using default datadir
    users:
        jsatt:
            password: <<password>>
            hosts:
                - localhost
                - 127.0.0.1
            databases:
                - database: "*"
        django:
            password: <<password>>
            hosts:
                - localhost
                - 127.0.0.1
            databases:
                - database: sample_db
                  grants: <<other privileges>>
                - database: other_db
    databases:
        - other_db
        - sample_db

hostnames:
    localhost.com:
        ip: 127.0.2.1

users:
    jsatt:
        password: <<password hash from /etc/shadow>>
        groups:
            - adm
            - jsatt
            - lpadmin
            - sudo
            - vboxusers
            - wheel
            - www-data
        fullname: Jeremy Satterfield
        ssh_keys:
            - <<pubkey for ssh key>>

# vim:set ft=yaml:
