FROM ubuntu:14.04
MAINTAINER Karolis Stasaitis <stkarolis@gmail.com>
RUN useradd -m -s /bin/bash quake2
ADD . /home/quake2/
RUN apt-get update
RUN apt-get install wget make libc6-dev libx11-dev libsdl1.2-dev libopenal-dev libpng12-dev libjpeg8-dev zlib1g-dev mesa-common-dev liblircclient-dev libcurl4-gnutls-dev -y
RUN wget -nv https://www.dropbox.com/s/hf2o135bvp4ccps/baseq2.tar.gz?dl=1 -O- | tar -zxvf - -C /home/quake2/
EXPOSE 27910/udp
RUN chown -R quake2:quake2 /home/quake2/
USER quake2
WORKDIR /home/quake2/
RUN make -C src
RUN mv src/q2proded .
RUN mv src/gamex86_64.so baseq2/
RUN ls -al
CMD ./q2proded +exec server.cfg
