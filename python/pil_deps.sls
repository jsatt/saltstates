PIL_dependencies:
    pkg.installed:
        - pkgs:
            - zlib1g
            - libjpeg-dev
            - libfreetype6-dev

# PIL doesn't look in the right place, so we need a few symlinks
/usr/lib/libfreetype.so:
    file.symlink:
        - target: /usr/lib/x86_64-linux-gnu/libfreetype.so
        - require:
            - pkg: PIL_dependencies

/usr/lib/libjpeg.so:
    file.symlink:
        - target: /usr/lib/x86_64-linux-gnu/libjpeg.so
        - require:
            - pkg: PIL_dependencies

/usr/lib/libz.so:
    file.symlink:
        - target: /usr/lib/x86_64-linux-gnu/libz.so
        - require:
            - pkg: PIL_dependencies

