How to build a perfect pxe server?

1. What do I mean perfect

	What's perfect?
	First, only basic idea! T_T
	You see:
	(1) support mutiple arch: x86, arm, openpower ...
	(2) support mutiple OS: windows, linux. Typically ...
	(3) support both UEFI and Legacy ... 


2. Choose platform
	
	Normally, we have two ways:
	(1) WDS (windows depolyment service), no doubt on windows system.
		With wds, we don't need to know the specific step to build loader.
	
	(2) DHCP+TFTP+HTTP, easier on linux system. Recommend redhat/centos.

3. Choose the perfect bootloader.

	Could make by yourself, and i build some:
	(1) Legacy
		- pxelinux.0
		  Would be the most popular stuff for legacy arch. WOOOOOW, definitely, perfect menu, extend function, additional message ... should be amazing.
		- grub4dos
		  Could be chainload by pxelinux.0, not the best choice. But you should know what's better than pxelinux.0.
		  This is just a readme, should be simple.
		- grub2
		
	(2) UEFI
		- grub4dos
		- grub2
		- syslinux.efi 
		  Tit support the same configuration file as pxelinux.0.
	
	(3) MIXED
		- ipxe
		  Which support both uefi and legacy, of course you have to use different ipxe loader, like ipxe.pxe\ipxe.efi\ipxe.lkrn\ipxe-sponly.pxe\ipxe-sponly.efi and so much.
		  Need to know, all these different loader can use only one config file.

4. Write the perfect menu
5. Add the perfect tool

Note:

Thanks for reading this over!
