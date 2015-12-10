FROM ubuntu:14.04
MAINTAINER Karolis Stasaitis <stkarolis@gmail.com>
RUN wget http://quake2world.net/files/quake2-quake2world.net-x86_64.tar.gz -O- | tar -xvf - -C quake2/
ADD server.cfg quake2/
WORKDIR quake2/
EXPOSE 27910/udp
CMD ./bin/quake +exec server.cfg +set dedicated 1
