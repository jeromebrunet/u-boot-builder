FROM debian:stable
MAINTAINER Jerome Brunet <jbrunet@baylibre.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl libssl-dev \
    gcc-aarch64-linux-gnu \
    git \
    bison \
    flex
