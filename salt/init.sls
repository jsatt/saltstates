{% for name, value in pillar['grains'].get(grains['id'], pillar['grains']['default']).items() %}
grains-{{name}}:
    grains.present:
        - name: {{name}}
        - value: {{value}}
{% endfor %}
