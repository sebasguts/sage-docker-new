FROM ubuntu:trusty

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    apt-get update -qq \
    && apt-get install -y wget tar python

RUN    adduser --quiet --shell /bin/bash --gecos "Sage user,101,," --disabled-password sage \
    && adduser sage sudo \
    && chown -R sage:sage /home/sage/ \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN    cd /opt \
    && wget ftp://ftp.fu-berlin.de/unix/misc/sage/linux/64bit/sage-6.10-Ubuntu_14.04-x86_64.tar.bz2 \
    && tar -xf sage-6.10-Ubuntu_14.04-x86_64.tar.bz2 \
    && rm sage-6.10-Ubuntu_14.04-x86_64.tar.bz2 \
    && cd SageMath \
    && ./sage </dev/null \
    && ln -snf /opt/SageMath/sage /usr/bin/sage \
    && chown -R sage:sage /opt/SageMath

USER sage
ENV HOME /home/sage
WORKDIR /home/sage

CMD [ "sage" ]
