#!/bin/bash

bucket_name=$1
HOME="/home/ubuntu"
AWS_CONFIG_FILE="/home/ubuntu/.aws/config"

# delete old backups
rm -rf /var/backups/daily/*

# creating backup
container_name=$(docker ps --format "{{.Names}}" | grep  link_shortener-stack_db.1)
docker exec -t $container_name pg_dumpall -c -U django > /var/backups/daily/dump.sql

# check that backup is not empty
FILESIZE=$(stat -c%s /var/backups/daily/dump.sql)
if [ $FILESIZE -eq 0 ]
then
    rm /var/backups/daily/dump.sql
    echo "Error creating backup!"
    exit 1
fi

aws s3 cp /var/backups/daily/dump.sql s3://$bucket_name/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql