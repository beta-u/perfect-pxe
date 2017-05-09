#!/bin/bash
# Scripts:
# Name: suse_ipxe_menu.sh
# Author: Lester
# Version: 1.0.0
# Description: use to generate a ipxe menu for suse(uefi).

####### HEAD Initializing ... ########
cat >> suse_ipxe.cfg << EOF
#!ipxe

#	set menu-timeout=200
#	set menu-default windows2012R2
#	set next-server 192.168.10.1
	set boot-url http://100.2.36.2/iso/suse

:start
	menu UEFI SUSE PXE Boot Menu
	item --gap --		-------- Install suse OS --------
	echo 

EOF
#####################################

for os in 12.2 12.1 12.0 11.4 11.3 11.2 11.1 11.0
do
	for arch in 64 32
	do 
		echo "	item suse${os}_${arch}		> suse${os}_${arch}" >> suse_ipxe.cfg
	done
done

######## BODY Initializing ##########
cat >> suse_ipxe.cfg << EOF
	
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

for os in 12.2 12.1 12.0 11.4 11.3 11.2 11.1 11.0 
do
	for arch in 64 32
	do 
cat >>suse_ipxe.cfg << EOF
:suse${os}_$arch
	kernel /grub2.cfg/suse/suse${os}_${arch}.efi
	boot

EOF
	done
done




