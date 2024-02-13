#!/bin/bash
if [ $# -ne 4 ]
then 
echo " error in entered arguments "
exit 1
fi

numberofbackups=$1
intervalsec=$2
mydir=$3
backupdir=$4
ls -lr $mydir > "directory-info.last"
backup=$(date '+%Y-%m-%d-%H-%M-%S')
mkdir -pv $backupdir/$backup
cp -r $mydir $backupdir/$backup
count=1
while true;
do
	sleep $intervalsec
	ls -lr $mydir > "directory-info.new"
	if ! cmp --silent "directory-info.new" "directory-info.last";
	then 
		backup=$(date '+%Y-%m-%d-%H-%M-%S')
		mkdir -v $backupdir/$backup
		cp -r $mydir $backupdir/$backup
		count=$((count+1))
		mv "directory-info.new" "directory-info.last"
		if [ $count -gt $numberofbackups ];
			then
			echo " oldest backup  will be removed "
			# ls -1t sorts by time then we get last file tail
			oldestbackup=$(ls -1t $backupdir | tail -n 1 )
			echo " the oldest backup was : $backupdir/$oldestbackup"
			rm -r $backupdir/$oldestbackup
			fi

	fi 
done
