#!/bin/bash
date=`date +%Y%m%d`
file="backup-${date}.tar.gz"

DB_TMP=/tmp/$file
pg_dumpall | gzip -c > $DB_TMP
aws s3 cp $DB_TMP s3://{{pillar.aws.backup.bucket}}/$file --sse
rm $DB_TMP
