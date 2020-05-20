FROM alpine:latest

MAINTAINER Beam <b-docker-wesher@grmbl.net>

ENV VERSION=20200520130800

RUN wget -O /usr/sbin/wesher https://github.com/costela/wesher/releases/download/v0.2.5/wesher-amd64 && chmod a+x /usr/sbin/wesher

CMD /usr/sbin/wesher
