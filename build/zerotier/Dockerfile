FROM parrot.run/core:5
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.0
ENV username=${username}
ENV apikey=${apikey}
ENV region=${region}
ENV as=${as}
ENV ip4=${ip4}
ENV ip6=${ip6}
ENV gw4=${gw4}
ENV gw6=${gw6}

# Update system
RUN apt-get update;apt-get -y dist-upgrade; rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update;apt-get -y install ca-certificates ssl-cert curl wget sudo;\
	rm -rf /var/lib/apt/lists/*

RUN apt-get update;curl -s https://install.zerotier.com | sudo bash || true;rm -rf /var/lib/apt/lists/*

COPY ./connect2anycast.sh /connect2anycast.sh
COPY ./start.sh /start.sh

CMD /start.sh
ENTRYPOINT /start.sh
