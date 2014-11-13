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
    'mrlittlejeans':
        - base
        - users
        - python
        - nginx
        - redis
        #- postgresql93
        - vcs.git
        - minidlna
        - transmission
        - projects.media_server
    'mapplethorpe':
        - base
        - users
        - desktop
        - python
        - nginx
        - redis
        - postgresql93
        - vcs
        #- ufw
        - media.spotify
        - media.audiokonverter
        - media.emusic-deps
        - browsers
        - vagrant
        - virtualbox
        - projects.healthgeist
    'jsattcom':
        - base
        - users
        #- python
        #- nginx
        #- postgresql
        #- supervisor
        #- mezzanine

# vim:set ft=yaml:
