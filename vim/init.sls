vim:
  pkgrepo.managed:
    - ppa: jonathonf/vim

  pkg.installed:
    - pkgs:
      - vim
      - vim-gui-common
    - require:
      - pkgrepo: vim

