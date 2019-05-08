#!/bin/sh
# simple shell script to sync files and folders between 2 servers
# Marco Matos marco@mmatos.com

# Edit these parameters first with your own data before running the script
LOCALDIR="/docker-data"
REMOTEDIR="/docker-data"
REMOTESERVER="172.16.xxx.x"
USERNAME="devops"

# create ssh keys if not present for current user
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
fi

# adds user passwordless login to remote server
echo "kindly type username's password when needed"
echo "in order to implement passwordless login"

echo "StrictHostKeyChecking no" >> ~/.ssh/config &
echo "yes \n" | ssh-copy-id -i ~/.ssh/id_rsa.pub  $USERNAME@$REMOTESERVER &&

rsync -av --ignore-existing $LOCALDIR/* $USERNAME@$REMOTESERVER:$REMOTEDIR ;
#rsync -av --dry-run --update $LOCALDIR/* $USERNAME@$REMOTESERVER:$REMOTEDIR ;
rsync -av --update  $LOCALDIR/* $USERNAME@$REMOTESERVER:$REMOTEDIR ;
echo "########  done" 

