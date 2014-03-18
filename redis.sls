/home/sys/redis/:
    file.directory:
        - user: redis
        - group: redis
        - mode: 755
        - makedirs: True

/etc/redis/redis.conf:
    file.managed:
        - source: salt://configs/redis/redis.conf
        - user: redis
        - group: redis
        - mode: 660

redis-server:
    pkg:
        - installed
        - require:
            - file: /etc/redis/redis.conf
    service:
        - running
        - watch:
            - file: /etc/redis/redis.conf

# vim:set ft=yaml:
