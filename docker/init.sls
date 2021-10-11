docker:
    pkgrepo.managed:
        - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{salt['grains.get']('oscodename', 'yakkety')}} stable
        - file: /etc/apt/sources.list.d/docker.list
        - key_url: https://download.docker.com/linux/ubuntu/gpg

    pkg.installed:
        - names:
            - apt-transport-https
            - ca-certificates
            - curl
            - software-properties-common
            - docker-ce
        - require:
            - pkgrepo: docker

    pip.installed:
      - name: docker
