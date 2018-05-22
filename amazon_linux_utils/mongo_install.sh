#!/bin/bash
# Amazon EC2 MongoDB installation
# Tested on Amazon Linux AMI release 2017.03

# Update the apt package index
sudo yum update -y

echo "Configure the package management system (yum)."
cat <<EOF >> mongodb-org-3.6.repo
[mongodb-org-3.6]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.6/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc
EOF

sudo mv mongodb-org-3.6.repo /etc/yum.repos.d/

echo "Install the MongoDB packages."
sudo yum install -y mongodb-org

echo "Start MongoDB"
sudo service mongod start

echo "Create users"
if grep -q "authorization: 'enabled'" /etc/mongod.conf ; then
	sudo sed -i -e "s/authorization: 'enabled'/authorization: 'disabled'/g" /etc/mongod.conf
	sudo service mongod restart
fi
if [ -f ./create_mongo_users.js ]; then
	echo "Create MongoDB users"
	mongo < create_mongo_users.js
fi

echo "Enable authorization and remote access"
sudo sed -i -e "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g" /etc/mongod.conf
if grep -q "authorization: 'disabled'" /etc/mongod.conf ; then
	sudo sed -i -e "s/authorization: 'disabled'/authorization: 'enabled'/g" /etc/mongod.conf
fi
if ! grep -q "authorization: 'enabled'" /etc/mongod.conf ; then
	sudo sed -i -e "s/#security:/#security:\nsecurity:\n  authorization: 'enabled'/g" /etc/mongod.conf
fi
sudo service mongod restart

