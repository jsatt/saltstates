include:
    - python

neovim:
    pkgrepo.managed:
        - ppa: neovim-ppa/unstable
    pkg.installed: []

neovim_deps:
    pkg.installed:
        - names:
            - xsel

    pip.installed:
        - names:
            - neovim
    cmd.run:
        - name: pip3 install neovim
