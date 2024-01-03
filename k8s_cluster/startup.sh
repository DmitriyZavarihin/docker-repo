#!/bin/bash
ansible-playbook -i hosts 1_rename_hosts.yml
ansible-playbook -i hosts 2_prepare_hosts.yml
ansible-playbook -i hosts 3_install_k8s.yml
ansible-playbook -i hosts 4_init_master.yml
ansible-playbook -i hosts 5_init_worker.yml
