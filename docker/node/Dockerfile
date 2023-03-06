FROM node:12-stretch

WORKDIR /srv/web

RUN apt-get -y update
RUN apt-get -y install \
  libgtkextra-dev \
  libx11-xcb-dev \
  libxtst6 \
  libxss1 \
  libnss3-dev \
  libasound2 \
  libatk-bridge2.0-0 \
  libgtk-3-0 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*