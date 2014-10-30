#!/bin/sh

make bin/ipxe.iso EMBED=/var/opt/ipxe/ipxe.conf && mv bin/ipxe.iso /var/opt/ipxe/
