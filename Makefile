CONTAINER_WKDIR=/app
DOCKER_NAMESPACE=hujindi1212
IMAGE_NAME=frontend
VERSION=latest

dev_build:
	docker build \
	-t $(DOCKER_NAMESPACE)/$(IMAGE_NAME):$(VERSION) \
	-f Dockerfile.dev .

dev_start:
	docker run -it \
	-p 3000:3000 \
	-v $(CONTAINER_WKDIR)/node_modules \
	-v ${PWD}:$(CONTAINER_WKDIR) \
	$(DOCKER_NAMESPACE)/$(IMAGE_NAME):$(VERSION)

dev_compose:
	docker-compose up 


dev_test:
	docker run -it \
	-v $(CONTAINER_WKDIR)/node_modules \
	-v ${PWD}:$(CONTAINER_WKDIR) \
	$(DOCKER_NAMESPACE)/$(IMAGE_NAME):$(VERSION) \
	yarn test

prod_build:
	docker build \
	-t $(DOCKER_NAMESPACE)/$(IMAGE_NAME):$(VERSION) \
	.

prod_start:
	docker run \
	-p 8080:80 \
	$(DOCKER_NAMESPACE)/$(IMAGE_NAME):$(VERSION)

clean:
	docker system prune --volumes --force