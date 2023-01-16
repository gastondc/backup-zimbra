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


Where `email@domain.com` is the email address of the mailbox you want to restore and `file.tgz` is the backup file of the mailbox or backup full of zimbra.
Please note that restoring a mailbox will delete all existing emails in the mailbox before the restoration. It is recommended to backup the existing emails before performing the restoration.


## Backup a single mailbox

su - zimbra -c "zmmailbox -z -m email@dominio.com getRestURL "//?fmt=tgz" > backup_email@dominio.com.tgz"

This command creates a backup of a specific mailbox on a Zimbra server by switching to the "zimbra" user, running the "zmmailbox" command, specifying the mailbox to backup and redirecting the output to a file named "backup_email@dominio.com.tgz" in tgz format.

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

Donde "email@dominio.com" es la dirección de correo electrónico del buzón que se desea restaurar y "file.tgz" es el archivo de copia de seguridad del buzón o completo del zimbra.
Ten en cuenta que la restauración de un buzón eliminará todos los correos electrónicos existentes en el buzón antes de la restauración. Es recomendable hacer una copia de seguridad de los correos electrónicos existentes antes de realizar la restauración.
``

## Backup de un solo buzón

su - zimbra -c "zmmailbox -z -m email@dominio.com getRestURL "//?fmt=tgz" > backup_email@dominio.com.tgz"


Este comando es utilizado para crear una copia de seguridad de un buzón específico en un servidor Zimbra. El comando se ejecuta como el usuario "zimbra", que tiene los permisos necesarios para ejecutar el comando zmmailbox. El comando zmmailbox se utiliza para crear una copia de seguridad del buzón especificado utilizando la bandera -m. La opción getRestURL "//?fmt=tgz" es utilizada para obtener la copia de seguridad en formato tgz, y finalmente el resultado del comando es redirigido a un archivo llamado "backup_email@dominio.com.tgz", que contendrá la copia de seguridad del buzón especificado.

<br>
<br>
<hr>
<br>
<br>


# Parameters:

<b>su - zimbra</b>: This switches to the "zimbra" user, which has the necessary permissions to run the zmmailbox command.

<b>zmmailbox -z -m email@dominio.com </b>: This runs the zmmailbox command, and specifies the mailbox to create a backup of using the -m flag.

<b>getRestURL "//?fmt=tgz" </b>: This option is used to get the backup in the format tgz > file.tgz: This redirects the output of the zmmailbox command to a 

<b>postRestURL '//?fmt=tgz&resolve=reset'</b>: This option is used to specify that the command should be used to restore the mailbox from a tgz file and to resolve all conflicts while restoring.
