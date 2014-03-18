heroku:
    pkgrepo.managed:
        - name: deb http://toolbelt.heroku.com/ubuntu ./
        - file: /etc/apt/sources.list.d/heroku.list
        - key_url: https://toolbelt.heroku.com/apt/release.key
    pkg.installed:
        - name: heroku-toolbelt 
        - require:
            - pkgrepo: heroku

