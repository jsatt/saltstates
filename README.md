jsatt.com Mezzanine
======================

Setup
-----

    sudo apt-get update
    sudo apt-get install git
    sudo git clone --single-branch --branch jsatt.com https://github.com/jsatt/saltstates.git /srv/salt
    ### clone pillar to /srv/pillar
    cd /srv/salt
    sudo ./setupsalt-minion
    sudo salt-call state.highstate

