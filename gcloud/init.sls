gcloud:
    pkgrepo.managed:
        - name: deb http://packages.cloud.google.com/apt cloud-sdk-{{salt['grains.get']('oscodename', 'bionic')}} main
        - file: /etc/apt/sources.list.d/google-cloud-sdk.list
        - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    pkg.installed:
        - names:
            - google-cloud-sdk
        - requires:
            - pkgrepo: gcloud
