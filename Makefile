DOCKER_REPO=registry.gocurb.internal:80
CONTAINER=$(DOCKER_REPO)/curbot

all: build push clean

build:
	docker build --no-cache -t $(CONTAINER):$(shell git rev-parse HEAD) . 
	docker build -t $(CONTAINER):latest . 

push:
	docker push $(CONTAINER)

clean:
	docker rmi $(CONTAINER)
