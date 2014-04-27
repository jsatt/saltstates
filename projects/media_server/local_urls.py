from django.conf.urls import patterns, include, url

urlpatterns = patterns(
    '',
    url(r'^podcasts/', include('podcast_client.urls', 'podcast_client')),
)
