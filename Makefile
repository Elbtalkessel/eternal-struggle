# Booting

boot:
	cd scripts && ./boot.sh $(filter-out $@,$(MAKECMDGOALS))

# EFI management

update-efi:
	cd scripts && ./run.sh updateEFI

mount-efi:
	cd scripts && ./run.sh mountEFI

umount-efi:
	cd scripts && ./run.sh umountEFI

enable-nbd:
	modprobe nbd max_part=8

disable-nbd:
	rmmod nbd

# Shortcuts

propertree:
	python3 tools/ProperTree/ProperTree.command &

smbios:
	python3 tools/GenSMBIOS/GenSMBIOS.command

ssdttime:
	./oc/Tools/SSDTTime/SSDTTime.command

chuserown:
	chown -R $(shell stat -c "%U" README.md) -- *
