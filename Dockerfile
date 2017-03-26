FROM mhart/alpine-node:5.12

MAINTAINER fuyaode
WORKDIR /root

RUN apk update && \
    apk add bzip2 make gawk gcc g++ && \
    wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 && \
    tar xvjf scws-1.2.3.tar.bz2 && \
    cd scws-1.2.3 && \
    ./configure --prefix=/usr/local/scws ; make ; make install

RUN apk del bzip2 make gcc g++ gawk
RUN rm -f scws-1.2.3.tar.bz2 && \
    rm -rf /root/scws-1.2.3

COPY ./XDB/* /root/xdb/
