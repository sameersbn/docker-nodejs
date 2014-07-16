# Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Limitations](#limitations)
- [How it works](#how-it-works)
- [Upgrading](#upgrading)
- [Uninstallation](#uninstallation)

# Introduction
Dockerfile to build a nodejs+express image with [nodemon](http://nodemon.io/).

# Installation

```bash
docker run -it --rm -v /usr/local/bin:/target \
sameersbn/nodejs:latest install
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

# Limitations

The only known limitation is that you cannot install node modules globally, that is to say `npm install -g <module-name>` will not work. These can only be installed from the `Dockerfile`. If you want to add node modules globally please send a PR.

# How it works

The wrapper scripts mount the current working directory and setup forwarding of port 3000 while starting the `sameersbn/nodejs` image. The command executed while starting the image is the same as the name of the wrapper script that was launched with whatever arguments were passed while running the wrapper script.

For example, if `npm start` is executed, the following command is executed by the wrapper script:

```bash
docker run -it --rm -p 3000:3000 \
  -v $PWD:/home/nodejs/src sameersbn/nodejs:latest npm start
```

# Upgrading

To upgrade to newer releases, simply update the image

```
docker pull sameersbn/nodejs:latest
```

# Uninstallation

```bash
docker run -it --rm -v /usr/local/bin:/target \
sameersbn/nodejs:latest uninstall
```
