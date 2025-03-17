#!/bin/sh
wget -qO- https://www.mongodb.org/static/pgp/server-8.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-8.0.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
sudo apt-get update
sudo apt-get install -y mongodb-mongosh
echo "Don't forget to enable ORDS for user developer: SQL> exec ORDS.ENABLE_SCHEMA;"
echo "Then run: mongosh 'mongodb://developer:free@localhost:27017/developer?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true' --tlsAllowInvalidCertificates"
