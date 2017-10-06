ARG WP_IMAGE="wordpress:4-php5.6-fpm-alpine"

FROM ${WP_IMAGE}

MAINTAINER Uni Mock <unimock@gate-m.de>

COPY tool /usr/local/bin/
RUN apk update && \
    apk add nano bash tree mysql-client less && \
    curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp-cli.phar && \
    curl -L https://dl.minio.io/client/mc/release/linux-amd64/mc                      > /usr/local/bin/mc          && \
    echo "alias wp='/usr/local/bin/wp-cli.phar --allow-root'"                                > /root/.bashrc       && \
    echo ". /etc/profile"                                                                   >> /root/.bashrc       && \
    echo "export PS1='\H:\w\\$ '"                                                           >> /etc/profile        && \
    echo "export LESS=-r"                                                                   >> /etc/profile        && \
    echo "alias ll='ls -alF'"                                                               >> /etc/profile        && \ 
    echo 'export TERM="xterm"'                                                              >> /etc/profile 

RUN chmod a+x /usr/local/bin/*

