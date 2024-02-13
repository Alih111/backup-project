
# backup

the project is backing up a directory into another place  



# where is the script




the project is inside backup folder with it's default makefile




# prerequesites


- bash

you can install it on ubuntu using:
```bash
sudo apt-get update
sudo apt-get install bash
```
# code overview
* the code makes the first backup saves it in given backup directory in a folder with name = current date
* the code checks every intervalsec(2nd arguments) seconds if a change happend to our directory
* if a change happend it adds another backup folder in backupdirectory with name = current date
* if number of backup folders more than max backups it removes the oldest backup

# how to use:
* call the script in the terminal
* enter the max number of backups
* time between backup checks
* the directory you want to backup
* where you want to back it up
# exit code
*  code 1:  means you entered wrong number of arguments
