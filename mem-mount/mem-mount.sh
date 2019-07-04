ram_tmp_bkp="/tmp/temp_extract" ;
sudo umount "${ram_tmp_bkp}" ;
mkdir -pv "${ram_tmp_bkp}" ;
total_of_free_memory="$(free -m | grep -i "Mem:" | awk '{print $7}')" ;
memory="$(expr ${total_of_free_memory} / 5)" ;
sudo mount -t tmpfs -o size=${memory}M,nr_inodes=${memory}k,mode=700 tmpfs "${ram_tmp_bkp}" ;