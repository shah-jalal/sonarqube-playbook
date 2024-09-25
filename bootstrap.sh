export DEBIAN_FRONTEND=noninteractive

#!/usr/bin/env bash
#Install the necessary packages
sudo apt-get update

#Configuring SSH user
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
systemctl restart sshd.service
#Create the user
useradd -m -s /bin/bash ubuntu
#Set the password
echo 'ubuntu:ubuntu' | chpasswd
#Add the new user to the sudoers group.
echo 'ubuntu  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
#Generate the SSH keys to enable SSH authentication
sudo -u ubuntu -i  mkdir -p ~/.ssh
sudo -u ubuntu -i  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa