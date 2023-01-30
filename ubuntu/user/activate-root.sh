#!/bin/bash

# Check if the current user is not root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Enable the root user
echo "Enabling the root user..."
passwd root

# Allow root user to log in via SSH
echo "Allowing root user to log in via SSH..."

# Backup the original sshd_config file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Edit the /etc/ssh/sshd_config file
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart the ssh service to apply the changes
systemctl restart ssh

echo "The root user is now enabled and can log in via SSH."
