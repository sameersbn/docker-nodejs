FROM sameersbn/ubuntu:14.04.20140818
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y apt-transport-https \
 && wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo 'deb https://deb.nodesource.com/node trusty main' > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install -y nodejs \
 && adduser --disabled-login --gecos 'NodeJS' nodejs \
 && npm install -g express-generator nodemon \
 && rm -rf /var/lib/apt/lists/* # 20140818

ADD scripts /scripts
ADD start /start
RUN chmod 755 /start

ENTRYPOINT ["/start"]
