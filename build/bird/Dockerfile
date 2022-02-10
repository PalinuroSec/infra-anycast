FROM docker.io/parrotsec/core:5.0
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.0
ENV region=${region}
ENV as=${as}
ENV ip4=${ip4}
ENV ip6=${ip6}
ENV gw4=${gw4}
ENV gw6=${gw6}
ENV bgppassword=${bgppassword}

# Update system
RUN apt-get update;apt-get -y dist-upgrade; rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update;apt-get -y install bird bird-bgp; \
	rm -rf /var/lib/apt/lists/*

COPY ./build/launchbird.sh /launchbird.sh

CMD /launchbird.sh