redis-server:
    pkg:
        - installed
    service:
        - running
        - watch:
            - pkg: redis-server
            - file: /etc/redis/redis.conf

/etc/redis/redis.conf:
    file.managed:
        - source: salt://redis/redis.conf
        - mode: 660
        - user: redis
        - group: redis
/etc/redis:
    file.directory:
        - user: redis
        - group: redis
        - mode: 770

# vim:set ft=yaml:
