#!/bin/bash

# Needed Vars

# path of the dir you want to restore backup FROM (MUST END WITH / if restoring FROM a dir) _ e.g /backup/Cent-Inc-date/
src=/home/ahmad/rsync_backups/CentOS-Inc_2016-08-16.16:17:45/

# path of the dir you want to restore the backup TO (MUST END WITH / if restoring TO a dir)
dest=/home/ahmad/Music/

# define backup prefix name i.e (CentOS, ubuntu-server, homePC, remoteSuse)
bckup_prefix_name=CentOS

# define file to log debug info to
log_file=./rsync.log

# path of the file which contains excluded dirs from restore (one per line) , only if you want to exclude file/dir from restoring (SHOULD INCLUDE --exclude-from=$excludes_file and --delete-excluded OPTIONS to rsync IF YOU WANT TO USE )
excludes_file=./restore_excludes

# make sure we're running as root
if (( `id -u` != 0 ))
	then { echo "`date` : ERR : Sorry, must be root.  Exiting..."; exit; }
fi

# check if needed files exists
if [ ! -e $excludes_file ]
	then 
	echo "`date` : (WARN) : Can't find restore excludes file at $excludes_file, ignore if you didn't add excludes file from restoring" >> $log_file
fi

# do actual resote 
rsync --archive --one-file-system --hard-links --numeric-ids --inplace --delete --log-file=$log_file $src $dest

# check if rsync executed successfully and add backup name to backups_list if so; else report error to log file.
if (( `echo $?` == 0 ))
	then
	echo "`date` : (INFO) :$dest, Successfully restored from $src, Done..." >> $log_file
	exit
else
	echo "`date` : (ERR) : $src , rsync failed check above lines, Exiting..." >> $log_file
	exit
fi