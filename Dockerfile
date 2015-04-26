FROM ubuntu:14.04

MAINTAINER Pepe Barbe <dev@antropoide.net>

RUN apt-get update && apt-get install -y transmission-daemon

ADD files/transmission-daemon /etc/transmission-daemon
ADD files/run_transmission.sh /run_transmission.sh

RUN mkdir -p /var/lib/transmission-daemon/incomplete && \
    mkdir -p /var/lib/transmission-daemon/downloads && \
    chown -R debian-transmission: /var/lib/transmission-daemon && \
    chown -R debian-transmission: /etc/transmission-daemon

VOLUME ["/var/lib/transmission-daemon"]
VOLUME ["/etc/transmission-daemon"]

EXPOSE 9091
EXPOSE 12345

CMD ["/run_transmission.sh"]
