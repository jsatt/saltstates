#!/bin/bash
s3Bucket={{pillar.storage.backup_bucket}}
date=`date +%Y%m%d`
file="backup-${date}.tar.gz"

cd /tmp
rm -rf backup
mkdir backup
cd backup

pg_dumpall | gzip -c > $file

s3cmd put $file s3://${s3Bucket}/backup/

cd
rm -rf /tmp/backup
