FROM ubuntu:trusty

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    apt-get update -qq \
    && apt-get install -y wget tar python

RUN    adduser --quiet --shell /bin/bash --gecos "Sage user,101,," --disabled-password sage \
    && chown -R sage:sage /home/sage/

ADD install_sage.sh /tmp/install_sage.sh
RUN    chmod +x /tmp/install_sage.sh \
    && /tmp/install_sage.sh

USER sage
ENV HOME /home/sage
WORKDIR /home/sage

CMD [ "sage" ]
