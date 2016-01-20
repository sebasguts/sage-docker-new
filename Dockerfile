FROM ubuntu:utopic

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    apt-get update -qq \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:aims/sagemath \
    && apt-get update -qq \
    && apt-get install sagemath-upstream-binary
