#!/bin/bash -ex
sudo apt-get install -y python-dev
sudo apt-get install -y build-essential
sudo pip install ansible
sudo ansible-playbook -i "localhost," -c local packages.yml
