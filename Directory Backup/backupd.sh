src_dir=$1
dest_dir=$2
interval_sec=$3
max_backups=$4

if [ ! -d "$dest_dir" ]; 
then		
	mkdir backup
	new_dir=$(date +'%Y%m%d-%H%M%S')
	mkdir $dest_dir/$new_dir
	cp -r $src_dir/ $dest_dir/$new_dir/
	cat current_status.txt > last_status.txt
fi

while true
do
	ls -Rl $src_dir>current_status.txt
	changed=$(diff current_status.txt last_status.txt | wc -l)
	if [ $changed -eq "0" ]; then
		echo "not changed"
	else
		echo "changed"
		new_dir=$(date +'%Y%m%d-%H%M%S')
		if [ $(ls $dest_dir | wc -l) -eq $max_backups ]; then
			rm -r $dest_dir/$(ls $dest_dir | head -n 1)
		fi
		mkdir $dest_dir/$new_dir
		cp -r $src_dir/ $dest_dir/$new_dir/
		cat current_status.txt > last_status.txt
	fi
	sleep $interval_sec
done	
