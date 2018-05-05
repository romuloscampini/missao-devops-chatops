FROM alpine:3.6
# Dicas Sobre o Alpine: http://blog.zot24.com/tips-tricks-with-alpine-docker/
LABEL Author="Rodrigo Martinez da Rocha" 

ENV NETDATA_VERSION 1.10.0

# Dependencias Alpine
RUN set -xe \
    && apk update && apk upgrade \
    && apk add autoconf automake bash build-base curl \
          'nodejs<6.11' 'nodejs-npm<8.11' 'python<2.8' \
          libmnl libmnl-dev libuuid util-linux-dev \
          zlib zlib-dev \
    && addgroup -g 1000 netdata \
    && adduser -D -h /home/netdata -s /bin/bash -u 1000 -G netdata netdata \
    && curl -sSL https://github.com/firehol/netdata/releases/download/v$NETDATA_VERSION/netdata-$NETDATA_VERSION.tar.gz | tar xz \
    && cd netdata-$NETDATA_VERSION \
    && ./netdata-installer.sh --dont-start-it --dont-wait \
    && cp system/netdata-openrc /etc/init.d/netdata \
    && chmod +x /etc/init.d/netdata \
    && cd .. \
    && rm -rf netdata-$NETDATA_VERSION

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python \
  && npm install -g coffeescript \
  && npm install -g yo generator-hubot

# Limpeza Imagem
RUN apk --purge -v del py-pip autoconf automake \
      build-base libmnl-dev util-linux-dev zlib-dev\
      && rm -rf /var/cache/apk/*

RUN mkdir /hubot && chown netdata:netdata /hubot
USER netdata
WORKDIR /hubot
ENV EXPRESS_PORT 8086

# CONFIGURACAO Master vs Slaves
ADD netdata-stream.slave.conf /etc/netdata/stream.conf

# INSTALACAO HUBOT
RUN yo hubot --owner="Rodrigo Rocha <rodrigogrohl@gmail.com>" --name="bender" --description="Chatops com Bender" --adapter=mattermost --defaults
COPY package.json package.json
ADD external-scripts.json /hubot/
RUN rm hubot-scripts.json
ADD scripts/*.coffee /hubot/scripts/
RUN npm install

EXPOSE 8086
EXPOSE 19999

ENTRYPOINT ["/bin/sh", "-c", "netdata &&  ./bin/hubot -a mattermost"]