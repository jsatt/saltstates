wheel:
    group.present

/etc/sudoers:
    file.append:
        - text: |
            %wheel ALL=(ALL) NOPASSWD:ALL

include:
    - users.jsatt

{% for username, user in salt['pillar.get']('users', {}).items() %}
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

{% if user.get('ssh_keys', []) -%}
sshkeys-{{ username }}:
    ssh_auth:
        - present
        - user: {{ username }}
        - names:
            {%- for key in user.ssh_keys %}
            - {{ key }}
            {%- endfor %}
{%- endif %}

{% endfor %}
# vim:set ft=yaml:
