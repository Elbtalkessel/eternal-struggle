# GPU
# Notes
Boot args `agdpmod=pikera`, `agdpmod=ignore` + MacPro7,1, `agdpmod=vit9696` and `-igfxmlr` does not work.
It seems `pikera` and `vit9696` are defualt.
`npci=0x2000` boot arg if mobo doesn't support above 4G encoding, mine does but I have it disabled. Does not work.
Connect directly to GPU does not work.
Remove `whatevergreen`? Does not work.
Removing `AppleALC.kext` doesn't help.
Tried adding SSDT-EC-DESKTOP.aml and power management related one.
Non verbose boot gives screen about failed boot and asks press any key.
`romfile="...path.."` on pci passtrhough in args does nothing

# Unrelated prob
SSDT-HPET.aml does fixes power mgm issue but sometimes doesn't
