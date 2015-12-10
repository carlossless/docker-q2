FROM ubuntu:14.04
MAINTAINER Karolis Stasaitis <stkarolis@gmail.com>
ADD . /opt/quake2
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install libsdl1.2debian -y
RUN mkdir quake2
RUN wget -nv http://quake2world.net/files/quake2-quake2world.net-x86_64.tar.gz -O- | tar -zxvf - -C /opt/quake2
WORKDIR /opt/quake2
EXPOSE 27910/udp
CMD ./bin/quake2 +exec server.cfg +set dedicated 1
