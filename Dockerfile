FROM bitnami/minideb:latest

MAINTAINER Azulinho

RUN apt-get update \
      && apt-get install -y bash \
      git \
      curl \
      python3 \
      python3-dev \
      build-essential \
      libffi-dev \
      libssl-dev \
      gcc \
      wget \
      unzip \
      bsdmainutils \
      virtualenv \
      python3-pip \
    && git clone https://github.com/tfutils/tfenv.git /opt/tfenv \
    && ln -s /opt/tfenv/bin/* /usr/local/bin \
    && pip3 install --upgrade pip \
    && pip3 install poetry \
    && mkdir -m 777 /opt/tfenv/versions \
    && wget -O /usr/bin/transcrypt https://raw.githubusercontent.com/elasticdog/transcrypt/master/transcrypt \
    && chmod +x /usr/bin/transcrypt \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
