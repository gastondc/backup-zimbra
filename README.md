# backup-zimbra


# Zimbra Backup Script

This script is used to create daily backups of a Zimbra Collaboration server, including the Zimbra files and MySQL databases. The backups are stored in the /backup/zimbra directory, and are organized by date. The script also copies the backups to a remote server, and deletes backups older than 30 days.

## Usage
1. Make sure the script has executable permissions: `chmod +x zimbra-backup.sh`
2. Execute the script: `./zimbra-backup.sh`

## Scheduling with crontab
To schedule the script to run daily at 2:00 AM, you can add the following line to the crontab:

0 2 * * * /path/to/script/zimbra-backup.sh


## Restore a single mailbox
To restore a single mailbox from the backup, you can use the `zmmailbox` command. The command to restore a specific mailbox is:

su - zimbra -c "zmmailbox -z -m email@domain.com postRestURL '//?fmt=tgz&resolve=reset' file.tgz "


Where `email@domain.com` is the email address of the mailbox you want to restore and `file.tgz` is the backup file of the mailbox.
Please note that restoring a mailbox will delete all existing emails in the mailbox before the restoration. It is recommended to backup the existing emails before performing the restoration.

