include:
    - python
    - supervisor

{% set app_name = 'media_server' %}
{% set app_dir = '/var/www/' + app_name %}
{% set app_user = 'media' %}

media_server_requirements:
    pkg.installed:
        - names:
            - build-essential
            - python-dev
            - libxslt1-dev
            - libxml2-dev
            - zlib1g-dev
            - libsqlite3-dev
            - libffi-dev
            - libssl-dev
    pip.installed:
        - names:
            - gunicorn
            - django-podcast-client
            - pysqlite
            - redis
        - require:
            - pkg: media_server_requirements

media_server_directory:
    file.directory:
        - name: {{app_dir}}
        - user: {{app_user}}
        - group: {{app_user}}
        - mode: 0755

media_server_file_directory:
    file.directory:
        - name: {{pillar.media_server.file_root}}
        - user: {{app_user}}
        - group: {{app_user}}
        - mode: 0777

django_media_server:
    git.latest:
        - name: https://github.com/jsatt/base_app.git
        - target: {{ app_dir }}
        - runas: {{ app_user }}
        - require:
            - file: media_server_directory
            - pip: media_server_requirements
    file.managed:
        - name: /etc/supervisor/conf.d/{{ app_name }}.conf
        - source: salt://projects/media_server/supervisor.conf
        - mode: 0644
        - template: jinja
        - defaults:
            app_dir: {{ app_dir }}
            app_name: {{ app_name }}
            app_user: {{ app_user }}
        - require:
            - pkg: supervisor
        - watch_in:
            - service: supervisor
            - cmd: restart_supervisor
    cmd.wait:
        - name: pip install -r requirements.txt
        - cwd: {{ app_dir }}
        - watch:
            - git: django_media_server

django_settings_media_server:
    file.managed:
        - name: {{app_dir}}/settings_override.py
        - source: salt://projects/media_server/settings_override.py
        - template: jinja
        - defaults:
            app_dir: {{ app_dir }}
        - require:
            - git: django_media_server

django_urls_media_server:
    file.managed:
        - name: {{app_dir}}/local_urls.py
        - source: salt://projects/media_server/local_urls.py
        - require:
            - git: django_media_server

podcast_updater:
    cron.present:
        - name: {{ app_dir }}/manage.py podcast --update
        - user: {{ app_user }}
        - minute: '*/30'

restart_media_server:
    cmd.wait:
        - name: supervisorctl restart {{ app_name }}
        - watch:
            - git: django_media_server
            - cmd: django_media_server
            - file: django_settings_media_server
            - file: django_urls_media_server


{% set ext_hd = pillar.media_server.get('ext_hd') %}
{% if ext_hd %}
ext_hd_mount:
    file.append:
        - name: /etc/fstab
        - text: UUID={{ext_hd.uuid}} {{ext_hd.mount_point}} {{ext_hd.fstype}} defaults 0 2
{% endif %}

#collect_static_media_server:
#    cmd.wait:
#        - name: python manage.py collectstatic --noinput
#        - cwd: {{ app_dir }}
#        - runas: {{ app_user }}
#        - watch:
#            - git: django_media_server
#            - cmd: django_media_server
