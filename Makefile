IMAGE_TAG ?= container-falcon
CONTAINER_TAG ?= container-falcon_1

#Get current directory
current_dir = $(shell pwd)

build-image:
	docker build -t $(IMAGE_TAG) .
remove-container:
	docker rm -f $(CONTAINER_TAG)
run-container:
	docker run --rm -d -it -p 8080:80 -v $(current_dir):/code --name=$(CONTAINER_TAG) $(IMAGE_TAG):latest
bash:
	docker exec -it $(CONTAINER_TAG) bash
start-api:
	gunicorn app.server:app -b 0.0.0.0:80 --reload