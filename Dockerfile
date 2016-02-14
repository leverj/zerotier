FROM debian:wheezy

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -o zerotier-one_1.1.4_amd64.deb https://download.zerotier.com/dist/zerotier-one_1.1.4_amd64.deb && \
    dpkg -i zerotier-one_1.1.4_amd64.deb && \
    service zerotier-one stop && \
    rm -f /var/lib/zerotier-one/{zerotier-one.pid,identity.secret,identity.public,authtoken.secret} && \
    rm zerotier-one*.deb

CMD /var/lib/zerotier-one/zerotier-one
