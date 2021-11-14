{% set docker = salt['pillar.get']('docker', {}) -%}

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

{%- if docker.get('use_nvidia_runtime', False) %}
{%- set distro = salt['grains.get']('os', 'ubuntu').lower() %}
{%- set version = salt['grains.get']('osrelease', '18.04') %}
{%- set arch = salt['grains.get']('osarch', 'amd64') %}
docker_nvidia_runtime_repo:
  pkgrepo.managed:
    - name: deb https://nvidia.github.io/libnvidia-container/stable/{{distro}}{{version}}/{{arch}} /
    - file: /etc/apt/sources.list.d/docker_nvidia_runtime.list
    - key_url: https://nvidia.github.io/nvidia-container-runtime/gpgkey

docker_nvidia_lib_runtime_repo:
  pkgrepo.managed:
    - name: deb https://nvidia.github.io/nvidia-container-runtime/stable/{{distro}}{{version}}/{{arch}} /
    - file: /etc/apt/sources.list.d/docker_nvidia_lib_runtime.list
    - key_url: https://nvidia.github.io/nvidia-container-runtime/gpgkey

docker_nvidia_runtime_pkg:
  pkg.installed:
    - name: nvidia-container-runtime
    - require:
      - pkgrepo: docker_nvidia_runtime_repo
      - pkgrepo: docker_nvidia_lib_runtime_repo
{%- endif %}
