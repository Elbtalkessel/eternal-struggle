passthrough:
	cd scripts && ./boot-passthrough.sh

boot:
	cd scripts && ./boot.sh

update-oc:
	cd scripts && ./update-image.sh

propertree:
	python3 oc/Tools/ProperTree/ProperTree.command &
