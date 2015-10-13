include:
    - nginx
    - supervisor
    - postgresql
    - python
    - python.pil

jsattcom:
    git.latest:
        - name: https://github.com/jsatt/jsattcom-mezzanine.git
        - target: /var/www/jsattcom-mezzanine/
        - watch_in:
            - service: supervisor
    file.managed:
        - name: /var/www/jsattcom-mezzanine/local_settings.py
        - source: salt://jsattcom/local_settings.py
        - mode: 0644
        - template: jinja
        - require:
            - git: jsattcom
    pip.installed:
        - requirements: /var/www/jsattcom-mezzanine/requirements.txt
        - watch:
            - git: jsattcom
        - require:
            - pkg: pillow_dependencies

sync_db:
    cmd.wait:
        - name: python manage.py syncdb --noinput
        - cwd: /var/www/jsattcom-mezzanine/
        - runas: www-data
        - watch:
            - git: jsattcom
        - require:
            - file: jsattcom
            - pip: jsattcom
            - sls: postgresql

db_migrations:
    cmd.wait:
        - name: python manage.py migrate
        - cwd: /var/www/jsattcom-mezzanine/
        - runas: www-data
        - watch:
            - git: jsattcom
        - require:
            - cmd: sync_db

collect_static:
    cmd.wait:
        - name: python manage.py collectstatic --noinput
        - cwd: /var/www/jsattcom-mezzanine/
        - runas: www-data
        - watch:
            - git: jsattcom

jsattcom_gunicorn:
    pip.installed:
        - name: gunicorn
        - require:
            - pip: jsattcom

jsattcom_supervisor:
    file.managed:
        - name: /etc/supervisor/conf.d/jsattcom.conf
        - source: salt://jsattcom/supervisor.conf
        - mode: 644
        - require:
            - pkg: supervisor
            - pip: jsattcom_gunicorn
        - watch_in:
            - service: supervisor

jsattcom_nginx:
    file.managed:
        - name: /etc/nginx/sites-enabled/jsatt.com
        - source: salt://jsattcom/nginx.conf
        - template: jinja
        - require:
            - pkg: nginx
            - file: jsattcom_ssl_crt
            - file: jsattcom_ssl_key
        - watch_in:
            - service: nginx

jsattcom_ssl_crt:
    file.managed:
        - name: /etc/nginx/ssl/star_jsatt_com.crt
        - source: salt://ssl/star_jsatt_com.crt
        - require:
            - pkg: nginx
            - file: /etc/nginx/ssl

jsattcom_ssl_key:
    file.managed:
        - name: /etc/nginx/ssl/star_jsatt_com.key
        - source: salt://ssl/star_jsatt_com.key
        - require:
            - pkg: nginx
            - file: /etc/nginx/ssl

