for i in 12.2 12.0 11.4 11.3 11.2 11.1 11.0 10.4 10.3 10.2 10.0
do
	for j in 64 32
	do
		cd /var/lib/tftpboot/images/suse
#		mkdir suse${i}_${j}
		cd suse${i}_${j}
		if [ "$j" == "64" ];then
			wget http://100.2.36.3/iso/suse/suse${i}_${j}/boot/x86_64/loader/linux
			wget http://100.2.36.3/iso/suse/suse${i}_${j}/boot/x86_64/loader/initrd
		else
			wget http://100.2.36.3/iso/suse/suse${i}_${j}/boot/i386/loader/linux
			wget http://100.2.36.3/iso/suse/suse${i}_${j}/boot/i386/loader/initrd
		fi

		cd /var/lib/tftpboot/images/suse
	done
done
