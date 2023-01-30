#!/bin/bash

# Backup the original ssh configuration file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Enable root login
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Restart ssh service to apply changes
sudo systemctl restart ssh

# Change root password
echo "Changing root password"
sudo passwd root

echo "Root user has been activated and password has been set. Please log in using root user and the new password."
