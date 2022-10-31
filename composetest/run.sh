#!/bin/bash
docker-compose up -d
ansible-playbook -i inventory.yaml playbook.yaml  --vault-password-file "./secret"
