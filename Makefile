__gom=$(shell which gom)
__go=$(shell which go)
__goconvey=$(shell which goconvey)

__BIN=bin

__PROG_NAME=ytsample
__PROG=$(__BIN)/$(__PROG_NAME)

__GOPATH=`pwd`:`pwd`/_vendor


all: build test info

clean:
	rm -f $(__PROG)

setup:
	$(__go) get github.com/mattn/gom

install:
	$(__gom) install

info:
	@echo "\nIntellJ - Go Application"
	@echo "  Run -> Environment variables"
	@echo "    Copy -> GOPATH=$(__GOPATH)"
	@echo "  Run -> Go file ✔"
	@echo "    Copy -> "`pwd`/main.go
	@echo "  Run -> Output executable name"
	@echo "    Copy -> console"
	@echo "  Run -> Arguments"
	@echo "    Copy -> -c conf/local.json"
	@echo "  Run -> Working directory"
	@echo "    Copy -> "`pwd`
	@echo "  Run -> Build before run -> Output directory"
	@echo "    Copy -> "`pwd`/bin
	@echo ""

build:
	GOPATH=$(__GOPATH) $(__go) build -o bin/$(__PROG_NAME) main.go

build-gom:
	$(__gom) build -o $(__PROG)

test:
	GOPATH=$(__GOPATH) $(__go) test

cover: goconvey

goconvey:
	GOPATH=$(__GOPATH) $(__goconvey)

run: run-local

run-local:
	$(__PROG) -c conf/local.json


.PHONY: all clean setup install info build build-gom test cover goconvey run run-local
