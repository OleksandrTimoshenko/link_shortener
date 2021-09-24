#!/bin/bash
bucket_name=$1

aws s3 cp /var/backups/daily/dump.sql s3://$bucket_name/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql