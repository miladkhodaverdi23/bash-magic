#!/bin/bash

# Backup the original ssh configuration file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Enable root login
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config

# Restart ssh service to apply changes
sudo systemctl restart sshd

while :
do
  # Take new_password from user
  echo "Enter new password for the root user:"
  read -s new_password
  echo
  echo "Confirm new password for the root user:"
  read -s new_password_confirm
  echo

  # Check if passwords match
  if [ "$new_password" = "$new_password_confirm" ]; then
    break
  else
    echo "Passwords do not match. Please try again."
  fi
done

echo "Changing root password"
sudo echo "root:$new_password" | sudo chpasswd

echo "Root user has been activated and password has been set. Please log in using root user and the new password."
