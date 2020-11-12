#!/bin/bash

#Required
domain=$1
commonname=$domain

#Change to your company details
country="BR"
state="Sao Paulo"
locality="Sao Paulo"
organization="SOMETHING SA"
organizationalunit="Tecnologia e Seguranca"
email="me@email.com"

#Optional
#password=""

if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Usage $0 [common name]"

    exit 99
fi

echo "Generating key request for $domain"

#Generate a key
openssl genrsa -out $domain.key 2048

#Remove passphrase from the key. Comment the line out to keep the passphrase
echo "Removing passphrase from key"
openssl rsa -in $domain.key -passin pass:$password -out $domain.key

#Create the request
echo "Creating CSR"
openssl req -new -key $domain.key -out $domain.csr -passin pass:$password \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat $domain.csr

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat $domain.key
