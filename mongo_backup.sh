#!/bin/bash
# Read config file
if [ -f ./config.txt ]; then
    while read -r a b; do
        if [ "$a" == "DB" ]; then
            DB="$b"
        elif [ "$a" == "DB_USER" ]; then
            DB_USER="$b"
        elif [ "$a" == "DB_PSWD" ]; then
            DB_PSWD="$b"
        fi
    done < config.txt
fi
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
# date for backup file name
DATE=`date +%Y%m%d`
# Create mongo dump file
echo "Dump $DB as $DB.$DATE.gz"
mongodump -u $DB_USER -p $DB_PSWD --authenticationDatabase $DB --archive=./backup/$DB.$DATE.gz --gzip --db $DB
# Upload to aws s3
echo "Upload $DB.$DATE.gz to s3"
aws s3 cp ./backup/$DB.$DATE.gz s3://nycdsa-jobportal/jobs-mongo-backup/
echo "Mongo DB dumped on aws s3 as $DB.$DATE.gz!"
# mongorestore --gzip --archive=$DB.$DATE.gz --db test
