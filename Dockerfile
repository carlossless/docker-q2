FROM ubuntu:14.04
MAINTAINER Karolis Stasaitis <stkarolis@gmail.com>
ADD . /opt/quake2
RUN useradd -m -s /bin/bash quake2
RUN chown -R quake2:quake2 /opt/quake2
RUN apt-get update
RUN apt-get install wget -y
RUN wget -nv http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar -zxvf - -C /opt/quake2
RUN wget -nv https://www.dropbox.com/s/1uiqjny37ucyqqm/baseq2.zip?dl=1 -O baseq2.zip; unzip baseq2.zip -d /opt/quake2/baseq2; rm baseq2.zip
WORKDIR /opt/quake2
EXPOSE 27910/udp
USER quake2
CMD ./q2proded +exec server.cfg
