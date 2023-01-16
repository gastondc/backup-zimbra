# backup-zimbra (english)


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


<br>
<br>
<hr>
<br>
<br>

# backup-zimbra (español/spanish)


# Script de Copia de Seguridad de Zimbra

Este script se utiliza para crear copias de seguridad diarias de un servidor de Zimbra Collaboration, incluyendo los archivos de Zimbra y las bases de datos MySQL. Las copias de seguridad se almacenan en el directorio /backup/zimbra, y están organizadas por fecha. El script también copia las copias de seguridad a un servidor remoto y elimina las copias de seguridad más antiguas de 30 días.

## Uso
1. Asegúrate de que el script tenga permisos ejecutables: `chmod +x zimbra-backup.sh`
2. Ejecuta el script: `./zimbra-backup.sh`

## Programación con crontab
Para programar el script para que se ejecute todos los días a las 2:00 AM, puedes agregar la siguiente línea al crontab:

0 2 * * * /ruta/del/script/zimbra-backup.sh


## Restaurar un solo buzón
Para restaurar un solo buzón de la copia de seguridad, puedes usar el comando `zmmailbox`. El comando para restaurar un buzón específico es:

su - zimbra -c "zmmailbox -z -m email@dominio.com postRestURL '//?fmt=tgz&resolve=reset' file.tgz "

Donde "email@dominio.com" es la dirección de correo electrónico del buzón que se desea restaurar y "file.tgz" es el archivo de copia de seguridad del buzón.
Ten en cuenta que la restauración de un buzón eliminará todos los correos electrónicos existentes en el buzón antes de la restauración. Es recomendable hacer una copia de seguridad de los correos electrónicos existentes antes de realizar la restauración.
``


