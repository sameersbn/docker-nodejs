all: build

build:
	@docker build --tag=${USER}/nodejs .

install uninstall: build
	@docker run -it --rm \
		-v /usr/local/bin:/target \
		${USER}/nodejs:latest $@
