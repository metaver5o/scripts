ram_tmp_bkp="/tmp/temp_extract" ;
umount "${ram_tmp_bkp}" ;
mkdir -v "${ram_tmp_bkp}" ;
total_of_free_memory="$(free -m | grep -i "Mem:" | awk '{print $7}')" ;
half_of_memory="$(expr ${total_of_free_memory} / 5)" ;
mount -t tmpfs -o size=${half_of_memory}M,nr_inodes=${half_of_memory}k,mode=700 tmpfs "${ram_tmp_bkp}" ;