#!/bin/bash
# Scripts:
# Name: rhel_ipxe_menu.sh
# Author: Lester
# Version: 1.0.0
# Description: use to generate a ipxe menu for rhel(uefi).

####### HEAD Initializing ... ########
cat >> rhel_ipxe.cfg << EOF
#!ipxe

#	set menu-timeout=200
#	set menu-default windows2012R2
#	set next-server 192.168.10.1
	set boot-url http://100.2.36.2/iso/rhel

:start
	menu UEFI rhel PXE Boot Menu
	item --gap --		-------- Install rhel OS --------
	echo 

EOF
#####################################

for os in 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3
do
	for arch in 64 32
	do 
		echo "	item rhel${os}_${arch}		> rhel${os}_${arch}" >> rhel_ipxe.cfg
	done
done

######## BODY Initializing ##########
cat >> rhel_ipxe.cfg << EOF
	
	item back			> back
	
	echo 
	item --gap --		--------------------------------
	item --key c config	------ Advanced Options -------

	item shell			Drop to iPXE shell
	item reboot			Reboot Server
	item --key x exit	Exit iPXE and continue BIOS boot
#	choose --timeout ${menu-timeout} --default ${menu-default} selected
	choose selected
	goto \${selected}


EOF
#####################################

for os in 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3
do
	for arch in 64 32
	do 
cat >>rhel_ipxe.cfg << EOF
:suse${os}_$arch
	kernel /grub2.cfg/rhel/rhel${os}_${arch}.efi
	boot

EOF
	done
done




