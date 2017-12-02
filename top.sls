base:
    'dignan':
        - base
        - users
        - desktop
        - python
        - nginx
        - redis
        - mysql
        - openvpn
        - vcs
        #- ufw
        - conaff
        - media.spotify
        - media.audiokonverter
        - browsers
        - virtualbox
        - desktop.hipchat
        - system.S27A850T
    'mrlittlejeans':
        - base
        - users
        - python
        - nginx
        - redis
        #- postgresql.93
        - vcs.git
        - minidlna
        - transmission
        - projects.media_server
    'mapplethorpe':
        - base
        - users
        - hosts
        - desktop
        - python
        - nginx
        #- redis
        - postgresql.96
        - vcs
        #- ufw
        - media.spotify
        - media.audiokonverter
        - media.emusic-deps
        - media.google-musicmanager
        - browsers
        - vagrant
        - virtualbox
        - openvpn
        #- projects.healthgeist
    'zissou':
        - base
        - users
        - hosts
        - desktop
        - python
        - python.pil_deps
        #- python.qt
        - nginx
        - redis
        - mysql
        #- postgresql.95
        - vcs
        - media.spotify
        - media.audiokonverter
        - browsers
        - virtualbox
        - summit
        - heroku
        - openvpn
        - docker
    'pagoda':
        - base
        - users
        - hosts
        - desktop
        - python
        - python.pil_deps
        - python.qt
        - nginx
        - mysql
        - postgresql.94
        - vcs
        - media.spotify
        - media.audiokonverter
        - browsers
        - virtualbox
        #- desktop.hipchat
        - summit
        #- statsd
        - heroku
        - openvpn
    'futureman':
        - base
        - users
        - python
        - nginx
        - redis
        - minidlna
        - transmission
        - projects.media_server
    'jsattcom':
        - base
        - users
        #- python
        #- nginx
        #- postgresql
        #- supervisor
        #- mezzanine

# vim:set ft=yaml:
