DEBUG = True
SECRET_KEY = '{{pillar.django.app.secret_key}}'
ALLOWED_HOSTS = {{pillar.django.app.allowed_hosts}}
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'database.db',
    }
}


LOCAL_INSTALLED_APPS = (
    'podcast_client',
)
