FROM rocker/r2u:22.04

LABEL org.opencontainers.image.authors="Aurelien Ginolhac <aurelien.ginolhac@uni.lu>"

LABEL description="Docker image to build the R teaching websites"


RUN apt-get update && \
  apt-get install -y \
  curl netbase \
  zip git \
  libcurl4-openssl-dev \
  pandoc
  
RUN install.r  rmarkdown 



ARG QUARTO_VERSION="1.4.555"
RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb && \
    apt-get update -qq && apt-get -y install \
    ./quarto-${QUARTO_VERSION}-linux-amd64.deb && rm quarto-${QUARTO_VERSION}-linux-amd64.deb \
    && apt autoremove -y && apt clean -y && rm -rf /var/lib/apt/lists/*

