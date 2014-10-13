### Nunux cloud configuration website.

Go to  [ROM-o-matic](https://rom-o-matic.eu/) website in order to generate iPXE image.

Choose "ISO bootable image" as output format and paste the following script:

```
#!ipxe

set base-url http://stable.release.core-os.net/amd64-usr/current
set config-url http://ncarlier.github.io/nunux-cloudinit/conf/nunux.yml
kernel ${base-url}/coreos_production_pxe.vmlinuz console=tty0 rootfstype=btrfs cloud-config-url=${config-url}
initrd ${base-url}/coreos_production_pxe_image.cpio.gz
boot
```

Build and upload the image to your cloud provider. Finally boot the machine.
