FROM stackbrew/ubuntu:saucy
RUN apt-get install -y --force-yes software-properties-common
RUN add-apt-repository ppa:oem-solutions-cdimage/oem-lb-alt
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse" >> /etc/apt/sources.list
ADD . /ezgo-image
RUN cp /ezgo-image/live-build-pin-600 /etc/apt/preferences.d/
RUN apt-get update
RUN apt-get install -y live-build genisoimage
#RUN cd /ezgo-image ; ./ezgo-image --arch amd64 --package kubuntu-desktop
