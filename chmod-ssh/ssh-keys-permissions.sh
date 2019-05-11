#!/bin/bash
# SSH keys hardening

chmod go-w /home/$USER
chmod 700 /home/$USER/.ssh
chmod 644 /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER/.ssh/authorized_keys 
chown $USER:$USER /home/$USER/.ssh
usermod -d /home/$USER $USER
sudo service ssh restart
