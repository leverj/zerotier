FROM debian:buster

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl gpg && \
    rm -rf /var/lib/apt/lists/* && \
    curl -s https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --import && \
    curl -s https://install.zerotier.com/ | gpg --output - >/tmp/zt-install.sh && bash /tmp/zt-install.sh && \
    service zerotier-one stop && \
    rm /var/lib/zerotier-one/identity.secret && rm /var/lib/zerotier-one/identity.public && rm /var/lib/zerotier-one/authtoken.secret

CMD /var/lib/zerotier-one/zerotier-one
