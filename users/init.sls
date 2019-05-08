wheel:
    group.present

/etc/sudoers:
    file.append:
        - text: |
            %wheel ALL=(ALL) NOPASSWD:ALL

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
        {% if user.get('fullname') %}- fullname: {{ user.fullname }}{% endif %}
        {% if user.get('shell') %}- shell: {{ user.shell }}{% endif %}

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

include:
    - users.jsatt
# vim:set ft=yaml:
