passthrough:
	cd scripts && ./boot-passthrough.sh

boot:
	cd scripts && ./boot.sh

update-oc:
	cd scripts && ./update-image.sh

propertree:
	python3 oc/Tools/ProperTree/ProperTree.command oc/EFI/OC/config.plist &

smbios:
	python3 oc/Tools/GenSMBIOS/GenSMBIOS.command

mountefi:
	sudo qemu-nbd --connect=/dev/nbd0 oc/OpenCore.qcow2
	sudo mount /dev/nbd0p1 /media

umountefi:
	sudo umount /media
	sudo qemu-nbd --disconnect /dev/nbd0

enablenbd:
	sudo modprobe nbd max_part=8

disablenbd:
	sudo rmmod nbd

ssdttime:
	./oc/Tools/SSDTTime/SSDTTime.command

update-kext:
	rm -rf oc/EFI/OC/Kexts/Lilu.kext oc/EFI/OC/Kexts/WhateverGreen.kext
	cp -r oc/Builds/Lilu.kext oc/Builds/WhateverGreen.kext oc/EFI/OC/Kexts/

update-core:
	mv -f oc/Builds/OpenCore/BOOT/BOOTx64.efi oc/EFI/BOOT/
	mv -f oc/Builds/OpenCore/OC/OpenCore.efi oc/EFI/OC/

