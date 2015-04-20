DOCKER_REPO=registry.gocurb.internal:80
CONTAINER=$(DOCKER_REPO)/curbot

all: build push

build:
	docker build -t $(CONTAINER):$(shell git rev-parse HEAD) . 
	docker build -t $(CONTAINER):latest . 

push:
	docker push $(CONTAINER)
