#!/bin/bash

echo "Backing up World"

date=`date +"%m-%d-%y_%H-%M"`

backupDir="/home/vhserver/backup"

fileName="worlds.$date.tar.gz"

worldsPath="/home/vhserver/.config/unity3d/IronGate/Valheim/worlds"

# Make the Backup
echo "tar -czvf /home/vhserver/backup/$fileName $worldsPath"
tar -czvf $backupDir/$fileName $worldsPath

# Make the Backup
numBackups=`find $backupDir -type f -print | wc -l`

if [ "$numBackups" -gt "10" ]; then
	echo "More than 10 backups, removing oldest"

	oldest=`find $backupDir -type f -printf '%T+ %p\n' | sort | head -n 1 | cut -d' ' -f2`
	echo Oldest: $oldest
	rm $oldest
fi

# Done with Backup
echo "Done with backup"

