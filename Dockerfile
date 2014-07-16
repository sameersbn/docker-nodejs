FROM sameersbn/ubuntu:12.04.20140628
MAINTAINER sameer@damagehead.com

RUN add-apt-repository -y ppa:chris-lea/node.js && \
		apt-get update && \
		apt-get install -y nodejs && \
		adduser --disabled-login --gecos 'NodeJS' nodejs && \
		npm install -g express-generator nodemon && \
		apt-get clean # 20140715

ADD start /start
RUN chmod 755 /start

EXPOSE 3000
VOLUME ["/home/nodejs/src"]

ENTRYPOINT ["/start"]
