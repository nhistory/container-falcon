IMAGE_TAG ?= container-falcon
CONTAINER_TAG ?= container-falcon_1

# Get current directory
current_dir = $(shell pwd)

CMD_DOCKER := docker exec $(CONTAINER_TAG)
CMD_BUILD_CONTAINER := docker build -t $(IMAGE_TAG) .
CMD_REMOVE_CONTAINER := docker rm -f $(CONTAINER_TAG)
CMD_RUN_CONTAINER := docker run --rm -d -it -p 8080:80 -v $(current_dir):/code --name=$(CONTAINER_TAG) $(IMAGE_TAG):latest

build-image:
	$(CMD_BUILD_CONTAINER)
remove-container:
	$(CMD_REMOVE_CONTAINER)
run-container:
	$(CMD_RUN_CONTAINER)

# Utilities
bash:
	docker exec -it $(CONTAINER_TAG) bash