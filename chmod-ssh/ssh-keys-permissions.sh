#!/bin/bash
# SSH keys hardening

chmod go-w $HOME
chmod 700 $HOME/.ssh
chmod 644 $HOME/.ssh/authorized_keys
chown $USER:$USER $HOME/.ssh/authorized_keys 
chown $USER:$USER $HOME/.ssh
usermod -d $HOME $USER
sudo service ssh restart
