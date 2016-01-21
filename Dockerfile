FROM ubuntu:trusty

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    apt-get update -qq \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:aims/sagemath \
    && apt-get update -qq \
    && apt-get install -y sagemath-upstream-binary
