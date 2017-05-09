#!/bin/bash

#	Program:
#		Only use to generator a valid bootloader file(or ks loaderfile).

#	Condition:
#		Your system must have grub2-efi installed.
#		Only for suse, other OS is under test.
#		Above kernel 3.3, all operation as usual.

#	History(v1.0, Beta):
#		Author: Lester		2017-3-2

#######################################################################

function sep()
{
	echo -e "\033[33m=======================================\033[0m"
}

function config()
{
	cat > boot/grub/grub.cfg << EOF
	set timeout=0
	menuentry "$os" --class os {
		insmod net
		insmod efinet
		insmod tftp
		insmod gzio
		insmod part_gpt
		insmod efi_gop
		insmod efi_uga
	
		set net_default_server=100.2.36.2
		net_add_addr eno0 efinet0 100.2.36.9
	
		echo 'Loading initial vmlinuz ramdisk ...'
		linux (tftp)/images/$dir/$os/linux splash=silent showopts
		echo 'Loading initial initrd ramdisk ...'
		initrd (tftp)/images/$dir/$os/initrd 
	}	
EOF

#	............. ks.efi ..............

	read -p "Build a grub for ks-boot?(y/n) " check
	echo
	if [ "$check" == "y" ];then
		read -p "Enter the name of ks file: " ksname
		read -p "Enter the path: " kspath
		sed -i "15a		linux (tftp)/images/rhel/$os/vmlinuz ks=" boot/grub/grub.cfg
		sed -i '15d' boot/grub/grub.cfg
	fi

#	...................................
}


function generate()
{

	grub2-mkstandalone -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi --fonts="unicode" -o bootx64.efi boot/grub/grub.cfg

	read -p "Enter the dir to put grub file, leave blank for default(default is /var/lib/tftpboot/grub2.cfg/suse): " location
if [ "$location" == "" ];then
	cp bootx64.efi /var/lib/tftpboot/grub2.cfg/suse/${os}.efi
else
	cp bootx64.efi $location/$os.efi
fi
rm /root/Desktop/workspace -rf
}
############### MAIN #################

echo 
mkdir -p  /root/Desktop/workspace/grub2-efi/
cd /root/Desktop/workspace/grub2-efi/
read -p "Enter the release(12.2_64 11.3_64): " release

os=suse$release
dir=suse
mkdir -p $os/boot/grub/
cd $os
config
generate


############### END ################
