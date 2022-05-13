# SPDX-FileCopyrightText: 2022, Carles Fernandez-Prades <carles.fernandez@cttc.es>
# SPDX-License-Identifier: MIT

FROM debian:jessie
LABEL version="1.0" description="BKG Ntrip Client (BNC)" maintainer="carles.fernandez@cttc.es"

RUN apt-get update && apt-get install -y \
  ca-certificates \
  evince \
  libqt4-svg \
  libqtwebkit4 \
  unzip \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /inputs && mkdir -p /outputs

WORKDIR /home

RUN wget https://igs.bkg.bund.de/root_ftp/NTRIP/software/bnc-2.12.18-debian8-64bit-shared.zip && \
  unzip bnc-2.12.18-debian8-64bit-shared.zip && \
  rm bnc-2.12.18-debian8-64bit-shared.zip && \
  cd bnc-2.12.18-debian8-64bit-shared && \
  mv bnc-2.12.18-debian8-64bit-shared /usr/bin/ && \
  mv Example_Configs ../ && \
  mv bnchelp.pdf .. && \
  cd .. && rm -rf bnc-2.12.18-debian8-64bit-shared

CMD ["/usr/bin/bnc-2.12.18-debian8-64bit-shared"]
