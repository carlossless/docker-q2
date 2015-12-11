FROM ubuntu:14.04
MAINTAINER Karolis Stasaitis <stkarolis@gmail.com>
ADD . /opt/quake2
RUN apt-get update
RUN apt-get install wget curl libjpeg-turbo8 libsdl1.2debian -y
RUN wget -nv http://quake2world.net/files/quake2-quake2world.net-x86_64.tar.gz -O- | tar -zxvf - -C /opt/quake2
WORKDIR /opt/quake2
EXPOSE 27910/udp
CMD ./bin/quake2 +set dedicated 1 +set ip 0.0.0.0 +map q2dm1 +set hostname "frag n chill"
