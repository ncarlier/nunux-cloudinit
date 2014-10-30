# iPXE ISO generator
#
# VERSION 0.0.1

FROM debian:jessie

MAINTAINER Nicolas Carlier <https://github.com/ncarlier>

ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get install -q -y git build-essential syslinux isolinux genisoimage && apt-get clean

# Install iPXE
RUN (cd /opt ; git clone git://git.ipxe.org/ipxe.git)

# Add ipxe configuration
RUN mkdir -p /var/opt/ipxe
COPY . /var/opt/ipxe
VOLUME ["/var/opt/ipxe"]

WORKDIR /opt/ipxe/src

# Build iPXE iso and delete the result to be able to rebuild the iso when running the container
RUN /var/opt/ipxe/gen.sh

ENTRYPOINT ["/var/opt/ipxe/gen.sh"]

