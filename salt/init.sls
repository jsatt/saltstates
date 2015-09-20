{% for name, value in pillar.get('grains', {}).get(grains['id'], pillar.get('grains', {}).get('default', {})).items() %}
grains-{{name}}:
    grains.present:
        - name: {{name}}
        - value: {{value}}
{% endfor %}
