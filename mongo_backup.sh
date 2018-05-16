#!/bin/bash
DB="jobs"
# Read DB
if [ -z "$DB" ]; then
        echo -n Database:
        read DB
fi
# Read Username
if [ -z "$DB_USER" ]; then
        echo -n User:
        read DB_USER
fi
# Read Password
if [ -z "$DB_PSWD" ]; then
        echo -n Password:
        read -s DB_PSWD
fi
DATE=`date +%Y%m%d`

echo "Dump $DB as $DB.$DATE.gz"
mongodump -u $DB_USER -p $DB_PSWD --authenticationDatabase $DB --archive=./backup/$DB.$DATE.gz --gzip --db $DB

echo "Upload $DB.$DATE.gz to s3"
aws s3 cp ./backup/$DB.$DATE.gz s3://nycdsa-jobportal/jobs-mongo-backup/

# mongorestore --gzip --archive=$DB.$DATE.gz --db test
