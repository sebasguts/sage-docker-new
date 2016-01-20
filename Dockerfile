FROM ubuntu:vivid

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    apt-add-repository -y ppa:aims/sagemath \
    && apt-get update -qq \
    && apt-get install sagemath-upstream-binary
