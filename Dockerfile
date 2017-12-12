FROM resin/rpi-raspbian

MAINTAINER AZsoftAlanZheng "A0955857152@gmail.com"

RUN apt-get -y update && \
apt-get install -yqq \
openssh-server \
wget \
libjpeg8-dev

RUN mkdir /usr/local/tonido && wget -q -O - http://patch.codelathe.com/tonido/live/installer/armv6l-rpi/tonido.tar.gz|tar zx -C /usr/local/tonido

##UNCOMMENT AND CHANGE THIS TO YOUR PASSWORD IF YOU WANT
#RUN echo 'root:<yourpasswordhere>' | chpasswd

#RUN ap-get install -yqq ffmpeg
#RUN ln -s /usr/bin/ffmpeg ffmpeg.exe
#RUN ln -s /usr/bin/ffmpeg ffmpegv.exe

#ADD tonido /etc/init.d/
#RUN chmod +x /etc/init.d/tonido
#RUN update-rc.d tonido defaults

RUN mkdir /data
VOLUME ["/data"]
WORKDIR /usb/local/tonido

EXPOSE 10001

#ADD start.sh /
#RUN chmod +x /start.sh
#CMD ["/start.sh"]
CMD /usr/local/tonido/tonido.sh start && /bin/bash
