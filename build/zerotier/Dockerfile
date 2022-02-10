FROM docker.io/parrotsec/core:5.0
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.0

# Update system
RUN apt-get update;apt-get -y dist-upgrade; rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update;apt-get -y install ca-certificates ssl-cert curl; \
	rm -rf /var/lib/apt/lists/*

RUN apt-gt update;curl -s https://install.zerotier.com | sudo bash;rm -rf /var/lib/apt/lists/*

COPY ../config/connect2anycast.sh /connect2anycast.sh
COPY ../config/start.sh /start.sh
RUN bash /connect2anycast.sh -u $username -p $password -r $region -a $as

CMD /start.sh