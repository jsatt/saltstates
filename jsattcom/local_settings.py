DEBUG = False
ALLOWED_HOSTS = ['{{pillar.django.allowed_host}}']

SECRET_KEY = '{{pillar.django.secret_key}}'
NEVERCACHE_KEY = '{{pillar.django.nevercache_key}}'

STATIC_URL = '{{pillar.django.static_url}}'
MEDIA_URL = '{{pillar.django.media_url}}'

{% set db_engine = pillar[pillar.django.db_engine] %}
{% set db_schema = db_engine.schemas[pillar.django.db_schema] %}
{% set db_user = db_engine.users[db_schema.owner] %}
DATABASES = {
    'default': {
        'ENGINE': '{{pillar.django.db_engine_module}}',
        'NAME': '{{pillar.django.db_schema}}',
        'USER': '{{db_user}}',
        'PASSWORD': '{{db_engine.users[db_user].password}}',
        'HOST': '{{db_engine.get('host', '127.0.0.1')}}',
        'POST': '{{db_engine.get('port', '')}}'
    }
}
