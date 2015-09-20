wheel:
    group.present

/etc/sudoers:
    file.append:
        - text: |
            %wheel ALL=(ALL) NOPASSWD:ALL

{% for username, user in salt['pillar.get']('users', {}).items() -%}
{% if user.get('absent', False) -%}
user-{{ username }}:
    user.absent:
        - name: {{ username }}
        - purge: True
        - force: True

{% elif grains['id'] in user.get('whitelist', []) or user.get('whitelist') == '*' -%}
user-{{ username }}:
    user.present:
        - name: {{ username }}
        {% if user.get('password', '') %}- password: {{ user.password }}{% endif %}
        {% if user.get('groups', []) -%}
        - optional_groups:
            {%- for group in user.groups %}
            - {{ group }}
            {%- endfor %}
        {%- endif %}
        - fullname: {{ user.get('fullname', username) }}
        - shell: {{ user.get('shell', '/bin/bash') }}

{% for ssh_auth in user.get('ssh_keys', []) -%}
sshkeys-{{ username }}-{{ssh_auth.key}}:
    ssh_auth.present:
        - user: {{ username }}
        - name: {{ ssh_auth.key }}
        {% if ssh_auth.get('enc') %}- enc: {{ssh_auth.enc}}{% endif %}
        {% if ssh_auth.get('comment') %}- comment: {{ssh_auth.comment}}{% endif %}
{% endfor -%}

{% endif -%}
{% endfor -%}
