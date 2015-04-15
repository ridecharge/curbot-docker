REPOSITORY=ridecharge
CONTAINER=$(REPOSITORY)/hubot

all: build push

build:
	docker build -t $(CONTAINER):$(shell git rev-parse HEAD) . 
	docker build -t $(CONTAINER):latest . 

push:
	docker push $(CONTAINER)
