#!/bin/bash

# Needed Vars
# path of the dir you want to backup (MUST END WITH / if backing up a DIR)
src=/home/ahmad/Music/

# path of the dir you want to store your incremental backups to
dest=/home/ahmad/rsync_backups/

# define backup prefix name i.e (CentOS, ubuntu-server, homePC, remoteSuse)
bckup_prefix_name=CentOS

# define the date format which will be added to backed-up file names (current format yyyy-mm-dd_hh:mm:ss)
current_date=`date +%Y-%m-%d.%H:%M:%S`

# define file to log debug info to
log_file=/var/log/rsync.log

# path of the file which contains excluded dirs from backup (one per line)
excludes_file=/backup_excludes

# path of the file which contains list of all backups done (full; then following incremental ones)
# DON't CREATE THIS FILE,UNLESS YOU KNOW WHAT YOU ARE DOING, THE SCRIPT WILL.
backups_list=/backups_lists

# make sure we're running as root
if (( `id -u` != 0 ))
	then { echo "`date` : ERR : Sorry, must be root.  Exiting..."; exit; }
fi

# check if needed files exists
if [ ! -e $excludes_file ]
	then 
	echo "`date` : (ERR) : Can't find backup excludes file at $excludes_file, Exiting..." >> $log_file
	exit
fi

if [ ! -e $backups_list ]
	then
	full_backup_name=$bckup_prefix_name-Full_$current_date
	# make full backup of $src
	rsync --archive --one-file-system --hard-links --numeric-ids --inplace --delete --delete-excluded --exclude-from=$excludes_file --log-file=$log_file $src $dest$full_backup_name/
	# check if rsync executed successfully and add backup name to backups_list if so; else report error to log file.
	if (( `echo $?` == 0 ))
		then
		echo $full_backup_name > $backups_list
		echo "`date` : (INFO) : $full_backup_name, Successfully backed-up $src, Done..." >> $log_file
		exit
	else
		echo "`date` : (ERR) : $full_backup_name, rsync failed check above lines, Exiting..." >> $log_file
		exit
	fi
fi

# prev, next Inc backup names
prev_bckup=`cat $backups_list|tail -n1`
next_bckup=$bckup_prefix_name-Inc_$current_date

# do an incremental backup (rsync)
rsync --archive --one-file-system --hard-links --numeric-ids --inplace --delete --delete-excluded --exclude-from=$excludes_file --log-file=$log_file --link-dest=$dest$prev_bckup/ $src $dest$next_bckup/

# check if rsync executed successfully and add backup name to backups_list if so; else report error to log file.
if (( `echo $?` == 0 ))
	then
	echo $next_bckup >> $backups_list
	echo "`date` : (INFO) : $next_bckup, Successfully backed-up $src, Done..." >> $log_file
else
	echo "`date` : (ERR) : $next_bckup, rsync failed check above lines, Exiting..." >> $log_file
fi