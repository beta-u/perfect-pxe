How to build a perfect pxe server?

1. What do I mean perfect

	What's perfect?
	First, i'm not that kind of expert, i can hardly write this doc frequently in English. So what i say, could be just some basic idea for you. Of course, it could be huge! T_T
	Let me discribe:
	(1) support mutiple arch: x86, arm, openpower ...
	(2) support mutiple OS: windows, linux. Typically ...
	(3)	support both UEFI and Legacy, most heavy and important ... 


2. Choose a perfect platform
	
	Normally, we have two ways:
	(1) WDS (windows depolyment service), no doubt on windows system.
		For me, wds is so perfect, cause to boot a windows system with pxe is a little odd. But with wds, we don't need to know the specific step.
	
	(2) DHCP+TFTP+HTTP, this way should be easier on linux system. I recommend redhat/centos especially, and you will know.

3. Choose the perfect bootloader.

	HAHA, this is the most big talk, so many bootloader, fresh don't know which to choose. I'll make that for you:
	(1) Legacy
		- pxelinux.0
		  Would be the most popular stuff for legacy arch. WOOOOOW, definitely, perfect menu, extend function, additional message ... should be amazing.
		- grub4dos
		  Could be chainload by pxelinux.0, not the best choice. But you should know what's better than pxelinux.0.
		  This is just a readme file, i should be simple.
		- grub2
		
	(2) UEFI
		- grub4dos
		- grub2
		- syslinux.efi 
		  This one i should explain, it support the same configuration file as pxelinux.0. HAHAHAHAHA, I guess it suprise you.
	
	(3) MIXED
		BEST CREAM HERE!
		- ipxe
		  Which support both uefi and legacy, of course you have to use different ipxe loader, like ipxe.pxe\ipxe.efi\ipxe.lkrn\ipxe-sponly.pxe\ipxe-sponly.efi and so much.
		  Need to know, all these different loader can use only one config file.

4. Write the perfect menu
5. Add the perfect tool

Note:
I'm not going to define so much perfection, like i said, 'I'm not a expert, just a normal user, may be a step ahead you.'
Thanks for reading this over, means a lot!