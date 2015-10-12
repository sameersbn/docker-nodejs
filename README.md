[![Docker Repository on Quay.io](https://quay.io/repository/sameersbn/nodejs/status "Docker Repository on Quay.io")](https://quay.io/repository/sameersbn/nodejs)

# Table of Contents
- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Usage](#usage)
- [Limitations](#limitations)
- [How it works](#how-it-works)
- [Upgrading](#upgrading)
- [Uninstallation](#uninstallation)

# Introduction

Dockerfile to build a nodejs+express image with [nodemon](http://nodemon.io/).

# Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/sameersbn/docker-nodejs/issues) they may encounter
- Support the development of this image with a [donation](http://www.damagehead.com/donate/)

# Installation

```bash
docker run -it --rm -v /usr/local/bin:/target \
quay.io/sameersbn/nodejs:latest install
```

This installs wrapper scripts to launch `node`, `nodejs`, `npm`, `express` and `nodemon` on the host.

# Usage
*Note: These commands are executed on the host*

```bash
express -c less myExpress
cd myExpress
npm install
npm start
```

You can also use `nodemon bin/www` instead of `npm start`.

[![Mind Blown](http://img4.wikia.nocookie.net/__cb20130223000930/adventuretimewithfinnandjake/images/b/b3/Kevin-Butler-Mind-Blown.gif)](https://www.youtube.com/v/kgsP_WAFbu0?start=94&end=100)

**If the command being executed is present on the host, then the host command is executed and the docker image is not started.**

# Limitations

The only known limitation is that you cannot install node modules globally, that is to say `npm install -g <module-name>` will not work. These can only be installed from the `Dockerfile`. If you want to add node modules globally please send a PR.

# How it works

The wrapper scripts mount the current working directory and host networking while starting the `quay.io/sameersbn/nodejs` image. The command executed while starting the image is the same as the name of the wrapper script that was launched with whatever arguments were passed while running the wrapper script.

For example, if `npm start` is executed, the following command is executed by the wrapper script:

```bash
docker run -it --rm --net=host \
  -v $PWD:/home/nodejs/src quay.io/sameersbn/nodejs:latest npm start
```

# Upgrading

To upgrade to newer releases, simply update the image

```
docker pull quay.io/sameersbn/nodejs:latest
```

# Uninstallation

```bash
docker run -it --rm -v /usr/local/bin:/target \
quay.io/sameersbn/nodejs:latest uninstall
```
