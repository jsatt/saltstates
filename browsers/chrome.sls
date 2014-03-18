google-chrome:
    pkgrepo.managed:
        - name: deb http://dl.google.com/linux/chrome/deb/ stable main
        - file: /etc/apt/sources.list.d/google-chrome.list
        - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
        - require_in:
            - pkg: google-chrome
    pkg.installed:
        - name: google-chrome-stable
        - require:
            - pkgrepo: google-chrome

