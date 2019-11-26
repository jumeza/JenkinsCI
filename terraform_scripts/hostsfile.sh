#!/bin/bash
# Build an automatic Ansible hosts file using Terraform outputs
echo [jenkins] > hosts
echo $(terraform output jenkins_public_ip) >> hosts
echo [web] >> hosts
echo $(terraform output web_public_ip) >> hosts
mv hosts ../ansible_playbooks/
echo ssh -i "key_terraform.pem" ubuntu@$(terraform output jenkins_public_ip) > jenkins.sh && chmod +x jenkins.sh
echo ssh -i "key_terraform.pem" ubuntu@$(terraform output web_public_ip) > web.sh && chmod +x web.sh
