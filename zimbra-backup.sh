#!/bin/bash

# Variables
ZIMBRA_HOME=/opt/zimbra
BACKUP_HOME=/backup/zimbra
DATE=`date +%Y-%m-%d`
REMOTE_SERVER=user@remote-server.com
REMOTE_DIR=/backup/zimbra
LOG_FILE=/var/log/zimbra-backup.log
RETENTION=2

log_check_message() {
    echo "$1 on $(date)" >> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo "[zbx_error] An error occurred during $1" >> $LOG_FILE
        exit 1
    fi
}

# Create daily backup directory
su - zimbra -c "mkdir -p ${BACKUP_HOME}/daily/${DATE}"
log_check_message "Creating backup directory"

# Listar usuarios 
users=$(su - zimbra -c "zmprov -l gaa")


# Backup Zimbra 
for i in $users
do 
  
  su - zimbra -c "zmmailbox -z -m $i getRestURL \"//?fmt=tgz\" > ${BACKUP_HOME}/daily/${DATE}/$i.tgz"
  log_check_message "Zimbra Backup $i"
done

# Backup mysql 
#mysqldump --opt --user=root --password=password --all-databases | gzip > ${BACKUP_HOME}/daily/${DATE}/zimbra-mysql.sql.gz
#log_check_message "MySQL Backup"

# Copy daily backup to remote server
scp -r ${BACKUP_HOME}/daily/${DATE} ${REMOTE_SERVER}:${REMOTE_DIR}
log_check_message "SCP Backup"

# Delete backups older than $RETENTION VARIABLE days
find ${BACKUP_HOME}/daily/* -mtime +$RETENTION -exec rm -rf {} \;
log_check_message "Deleting old backups"

log_check_message "Backup completed successfully"