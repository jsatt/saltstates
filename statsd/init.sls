include:
    - nodejs
    - supervisor

git://github.com/etsy/statsd.git:
    git.latest:
        - target: /opt/statsd
        - unless: test -d /opt/statsd

statsd-amqp:
    npm.installed:
        - name: mrtazz/statsd-amqp-backend
        - dir: /opt/statsd
        - require:
            - pkg: nodejs

/opt/statsd/config.js:
    file.managed:
        - source: salt://statsd/amqpConfig.js
        - template: jinja
        - require:
            - git: git://github.com/etsy/statsd.git

#/etc/supervisor/conf.d/statsd.conf:
#    file.managed:
#        - source: salt://statsd/statsd-supervisor.conf
#        - mode: 644
#        - makedirs: True
#        - require:
#            - pkg: supervisor
#            - file: /opt/statsd/config.js
#        - watch_in:
#            - service: supervisor

