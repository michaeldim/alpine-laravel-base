CURRENT_DIRECTORY := $(shell pwd)
NAME := $(shell basename "$(PWD)")
TAG = latest
IMAGE = michaeldim/$(NAME)

build:
	@docker build -t $(IMAGE):$(TAG) $(CURRENT_DIRECTORY)

build-no-cache:
	@docker build -t $(IMAGE):$(TAG) --no-cache $(CURRENT_DIRECTORY)

.PHONY: build build-no-cache
