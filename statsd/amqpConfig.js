{% set statsd = pillar.get('statsd', {}).get('config', {}) -%}
{
    backends: ['statsd-amqp-backend'],
    amqp: {
        debug: true,
        host: '{{statsd.get('amqp_host', 'localhost')}}',
        port: {{statsd.get('amqp_port', '5672')}},
        login: '{{statsd.get('amqp_login', '')}}',
        password: '{{statsd.get('amqp_password', '')}}',
        vhost: '{{statsd.get('amqp_vhost', '/')}}',
        defaultExchange: '{{statsd.get('amqp_exchange', '')}}',
        messageFormat: 'graphite'
    },
        debug: true,
    port: {{statsd.get('port', 8125)}},
    address: "{{statsd.get('bind_address', '127.0.0.1')}}",
    flushInterval: {{statsd.get('flush_interval', 1000)}}
}
