all: build

build:
	@docker build --tag=quay.io/sameersbn/nodejs .

install uninstall: build
	@docker run -it --rm \
		-v /usr/local/bin:/target \
		quay.io/sameersbn/nodejs:latest $@
