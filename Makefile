SHELL := /bin/bash

NAME=go-boilerplate
PKG_NAME=github.com/adambabik/${NAME}
ENTRYPOINT=./cmd

VERSION=`git describe --tags || echo dev`
BUILD_DATE=`date -u +%FT%TZ`
IMAGE_TAG=latest
LDFLAGS=-ldflags "-w -s -X ${PKG_NAME}.Version=${VERSION} -X ${PKG_NAME}.BuildDate=${BUILD_DATE}"

build:
	go build ${LDFLAGS} -i -o ./build/${NAME} ${ENTRYPOINT}
.PHONY: build

build_linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -o ./build/${NAME}_linux-amd64 ${ENTRYPOINT}
.PHONY: build_linux

image: build_linux
	docker build --build-arg binary_name=${NAME} -t ${NAME}:${IMAGE_TAG} .
.PHONY: image

remock:
	# example: mockgen -source=checkpoint/type.go -package=checkpoint > checkpoint/type_mock.go
.PHONY: remock

test: remock
	godep go test -race ./...
.PHONY: test

install:
	go get -u github.com/tools/godep
.PHONY: install

install_test:
	go get -u github.com/golang/mock/gomock
	go get -u github.com/golang/mock/mockgen
.PHONY: test_install
