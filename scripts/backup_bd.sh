#!/bin/bash 

# File name
NAME= backup_bd
# File location
BACKUP=/root/backup
# Site name
SITENAME=site.com
# Backup files
FILES="
/var/www/"$SITENAME"
/etc/
"
# Database name
DB=db
# Database login
USER=username
# Database password
PASS=password

mysqldump -u $USER -p$PASS $DB | gzip -9 > $BACKUP/$NAME-`date +"%A"`.sql.gz
tar -czf $BACKUP/$NAME-`date +"%A"`.tar.gz $FILES 
