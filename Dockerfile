ARG WP_IMAGE="wordpress:4-php5.6-fpm-alpine"

FROM ${WP_IMAGE}

MAINTAINER Uni Mock <unimock@gate-m.de>

RUN apk update && \
    apk add nano bash tree mysql-client less && \
    curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp-cli.phar && \
    curl -L https://dl.minio.io/client/mc/release/linux-amd64/mc                      > /usr/local/bin/mc          && \
    chmod a+x /usr/local/bin/*                                                                                     && \
    echo "alias wp='/usr/local/bin/wp-cli.phar --allow-root'"                                > /root/.bashrc       && \
    echo ". /etc/profile"                                                                   >> /root/.bashrc       && \
    echo "export PS1='\H:\w\\$ '"                                                            > /etc/profile.d/tool && \
    echo "alias ll='ls -alF'"                                                               >> /etc/profile.d/tool && \ 
    echo 'export TERM="xterm"'                                                              >> /etc/profile.d/tool 

COPY tool /usr/local/bin/
RUN  chmod a+x /usr/local/bin/tool

#RUN echo ' some hints:'                                                                           >> /help && \
#    echo '  * wp ...... wordpress cli'                                                            >> /help && \
#    echo '  * mysql ... database operations:'                                                     >> /help && \
#    echo '              mysql -h ${WORDPRESS_DB_HOST%:3306} -u root -p$WORDPRESS_DB_PASSWORD'     >> /help && \
#    echo '  * nano .... editor'                                                                   >> /help && \
#    echo '  * mc ...... tbd'                                                                      >> /help && \
#    echo '  * wget .... tbd'                                                                      >> /help && \
#    echo '  * curl .... tbd'                                                                      >> /help && \
#    echo '  * exit .... logout'                                                                   >> /help && \
#    echo '  ! only <mysql database> and </var/www/html> are persistent for recreate containers !' >> /help && \
#    echo '  Umgang mit mc'                                                                        >> /help && \
#    echo ''                                                                                       >> /help

