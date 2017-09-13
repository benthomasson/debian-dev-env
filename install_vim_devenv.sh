#!/bin/bash -ex
ansible-playbook -i "localhost," -c local vim.yml
