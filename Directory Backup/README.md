## Backup Directory Program
	backupd.sh <dir> <backupdir> <interval-secs> <max-backups>
Backup the directory <dir> by making a copy of dir in the the directory backupdir/<current_date>, repeat if an update occured in the <dir> status (check every <interval-secs> for updates) where only <max-backups> number of backups need to be reserved.
N.B: <current_date> will have the format YYYY-MM-DD-hh-mm-ss.

## Folder Hirealically
Script: /home/lab2/backupd.sh
Directory dir: /home/lab2/source
Directory backupdir: /home/lab2/backup

## Prepreqisits
Install make command: "$ sudo apt make"
create two text files: 1. current_status.txt	2. last_status.txt	

## Running Instructions
1. Go to the directory which contains the script: write "cd lab2" command in the terminal
2. Two ways to run the code: 
	1. Run the code itself: write "backupd.sh <dir> <backupdir> <interval-secs> <max-backups>" command in the terminal with passing the required parameters
	2. Using the Makefile: write the command "make" in the terminal	
