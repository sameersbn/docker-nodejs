FROM sameersbn/ubuntu:12.04.20140818
MAINTAINER sameer@damagehead.com

RUN wget -q https://deb.nodesource.com/setup -O - | bash - && \
		apt-get install -y nodejs && \
		adduser --disabled-login --gecos 'NodeJS' nodejs && \
		npm install -g express-generator nodemon && \
		apt-get clean && rm -rf /var/lib/apt/lists/* # 20140818

ADD scripts /scripts
ADD start /start
RUN chmod 755 /start

ENTRYPOINT ["/start"]
