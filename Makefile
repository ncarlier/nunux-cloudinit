.SILENT :
.PHONY : build clean run shell

USERNAME:=ncarlier
APPNAME:=ipxe-geniso
IMAGE:=$(USERNAME)/$(APPNAME)

define docker_run_flags
--rm \
-v $(PWD):/var/opt/ipxe \
-it
endef

all: build

build:
	echo "Building $(IMAGE) docker image..."
	sudo docker build --rm -t $(IMAGE) .

clean:
	echo "Removing $(IMAGE) docker image..."
	sudo docker rmi $(IMAGE)

run:
	echo "Running $(IMAGE) docker image..."
	sudo docker run $(docker_run_flags) --name $(APPNAME) $(IMAGE)

shell:
	echo "Running $(IMAGE) docker image with shell access..."
	sudo docker run $(docker_run_flags) --entrypoint="/bin/bash" $(IMAGE) -c /bin/bash

