FROM debian:wheezy

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -s https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --import
RUN curl -s https://install.zerotier.com/ | gpg --output - >/tmp/zt-install.sh && bash /tmp/zt-install.sh && \
    service zerotier-one stop && \
    rm -f /var/lib/zerotier-one/{zerotier-one.pid,identity.secret,identity.public,authtoken.secret}

CMD /var/lib/zerotier-one/zerotier-one
