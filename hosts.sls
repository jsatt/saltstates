{% for hostname, host in pillar.get('hostnames', {}).items() %}
{{hostname}}:
    host.present:
        - ip: {{host['ip']}}
        {% if host.get('names', '') %}- names: {{host['names']}}{% endif %}
{% endfor %}

# vim:set ft=yaml:
