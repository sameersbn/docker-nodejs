FROM sameersbn/debian:jessie.20140918
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y nodejs npm \
 && ln -sf /usr/bin/nodejs /usr/bin/node \
 && adduser --disabled-login --gecos 'NodeJS' nodejs \
 && npm install -g express-generator nodemon \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD scripts /scripts
ADD start /start
RUN chmod 755 /start

ENTRYPOINT ["/start"]
