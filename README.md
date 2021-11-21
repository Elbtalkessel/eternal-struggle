# Specs
- CPU: `AMD Ryzen 7 3700X (16) @ 3.600GHz`
- GPU: `AMD ATI 5700 RX`
- GPU: `AMD ATI Radeon PRO WX 2000`
- Memory: `32GB`
- Mobo: `Asus Strix X570-F`

# Notes
- Boot args `agdpmod=pikera`, `agdpmod=ignore` + MacPro7,1, `agdpmod=vit9696` and `-igfxmlr` does not work.
- It seems `pikera` and `vit9696` are defualt.
- `npci=0x2000` boot arg if mobo doesn't support above 4G encoding, mine does but I have it disabled. Does not work.
- Connect directly to GPU does not work.
- Remove `whatevergreen`? Does not work.
- Removing `AppleALC.kext` doesn't help.
- Tried adding SSDT-EC-DESKTOP.aml and power management related one.
- Non verbose boot gives screen about failed boot and asks press any key.
- `romfile="...path.."` on pci passtrhough in args does nothing.
- 1024x768 resolution did not help.
- Adding `CtlnaAHCIPort` didn't help, though maybe SATA drivers missing so it can't mount disks or smth. Will leave it for now.
- Adding `AppleIntelE1000e` fixed(?) complains about missing driver during boot, prob unrelated and can be removed later.
- CPU power management issue is fixed by setting Cpuid1Data and Mask to empty string.
- https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html#black-screen-after-ioconsoleusers-gioscreenlock-on-navi does not work
- `-radpg=15`, `-rad24`, `-radvesa`, `-raddvi` no luck. `-radvesa` panics if used together with `agdpmod=pikera`
# Unrelated prob
- SSDT-HPET.aml do fixes power mgm issue but sometimes doesn't

# Current issue
_Stuck at_

- gIOScreenLockState 3, hs 0, bs 0, now 0, sm 0x0
- `ACPI_SMC_PlatformPlugin::start - waitForService(resourceMatching(AppleInterlCPUPowerManagement)) timed out` issue persist, seems SSDT-HPET doesn't fix.

_Before it_

- KextLog: kernelmanagerd is not active
- apfs_keybag_init failed to initialize volume keybag, err = 2
  one reddit thread says it's gpu related, navi 6x, although mine is 5x. Vega works fine (how tho?)
- SATA WARNING: IDENTIFY DEVICE checksum not implemented
- IOUserServer Driver Kit AppleEthernetE1000 server exit before starting
- AppleKeyStore uexpected session: 100000 uid: -1 requested by: 118
- AppleKeyStore operation failed
- EXC_RESOURCE -> MRT[71] exceeded mem limit: InactiveSoft 50MB (non-fatal)
- AppleIntelCPuPowerManagement timeout out *(not always)*
