all: build

build:
	@docker build --tag=sameersbn/nodejs .

install uninstall: build
	@docker run -it --rm \
		-v /usr/local/bin:/target \
		sameersbn/nodejs:latest $@
