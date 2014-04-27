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

# vim:set ft=yaml:
