# Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
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
