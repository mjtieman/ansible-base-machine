#!/bin/bash
username=$1
vault_pass_file=$2

if [[ -z $username ]]
then
  echo "Username is required"
  exit
fi

if [[ -z $vault_pass_file ]]
then
  echo "Vault password file path is required"
  exit
fi

# Packages necessary to run ansible
sudo apt-get update
sudo apt-get install libffi-dev -y
sudo apt-get install libssl-dev -y
sudo apt-get install libpython-all-dev -y
sudo apt-get install python-pip -y

# Upgrade pip as local user
pip install --upgrade pip

# Install ansible
sudo pip install ansible==2.2.0

# Add our custom ansible config
sudo mkdir -p /etc/ansible
sudo chown $username /etc/ansible
sudo cp ansible-base/ansible.cfg /etc/ansible/ansible.cfg
sudo chown $username /etc/ansible/ansible.cfg

# Create the ansible log file
sudo touch /var/log/ansible.log
sudo chown $username /var/log/ansible.log
sudo chmod 666 /var/log/ansible.log

# Run the configure playbook
ansible-playbook ansible-base/configure.yml --verbose --limit localhost --inventory-file ansible-base/inv --extra-vars "username=$username" --vault-password-file $vault_pass_file
