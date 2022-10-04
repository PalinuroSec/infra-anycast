FROM parrot.run/core:5
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.0
ENV region=${region}
ENV as=${as}
ENV bgppassword=${bgppassword}

# Update system
RUN apt-get update;apt-get -y dist-upgrade; rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update;apt-get -y install bird bird-bgp; mkdir -p /run/bird; \
	rm -rf /var/lib/apt/lists/*

CMD /start.sh
ENTRYPOINT /start.sh
