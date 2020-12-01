#!/bin/bash
export CERT="file.pem"
export USERNAME="ubuntu"
export MIDDLE_IP="x.x.x.x"
export DEST_IP="y.y.y.y"
export PORT="80"

ssh -fN -o \
          GlobalKnownHostsFile=/dev/null \
          -o UserKnownHostsFile=/dev/null \
          -o StrictHostKeyChecking=no \
          -i "~/${CERT}" \
          ${USERNAME}@${MIDDLE_IP} \
          -L${PORT}:${DEST_IP}:${PORT}