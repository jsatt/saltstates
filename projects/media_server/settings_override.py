DEBUG = True
SECRET_KEY = '{{pillar.django.app.secret_key}}'
ALLOWED_HOSTS = {{pillar.django.app.allowed_hosts}}
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': '{{app_dir}}/database.db',
    }
}

MEDIA_ROOT = '{{pillar.media_server.file_root}}'


LOCAL_INSTALLED_APPS = (
    'podcast_client',
)
