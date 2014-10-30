## Nunux cloud configuration website.

The purpose of this project is to build an iPXE ISO file with an embedded configuration
that provide the ability to boot on CoreOS with an online cloud-init configuration.

### Create iPXE ISO

#### With ROM-o-matic

Go to [ROM-o-matic](https://rom-o-matic.eu/) website in order to generate iPXE image.

Choose "ISO bootable image" as output format and paste the content of the ipxe.conf file.

Build and upload the image to your cloud provider. Finally boot the machine.

#### With Docker

Run the following commands:

    $ make
    $ make run

Get the generated ipxe.iso file and upload it to your cloud provider. Finally boot the machine.
