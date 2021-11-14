passthrough:
	cd scripts && ./boot-passthrough.sh

boot:
	cd scripts && ./boot.sh

update-oc:
	cd scripts && ./update-image.sh

propertree:
	python3 oc/Tools/ProperTree/ProperTree.command &

smbios:
	python3 oc/Tools/GenSMBIOS/GenSMBIOS.command

mountefi:
	sudo qemu-nbd --connect=/dev/nbd0 oc/OpenCore.qcow2
	sudo mount /dev/nbd0p1 /media

umountefi:
	sudo umount /media
	sudo qemu-nbd --disconnect /dev/nbd0

