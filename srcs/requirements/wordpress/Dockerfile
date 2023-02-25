FROM debian:bullseye 

RUN apt-get update && \
	apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql curl 	mariadb-client 
WORKDIR /tmp/
ENV BUILDDIR=/tmp/build/
RUN mkdir ${BUILDDIR}
RUN mkdir -p /run/php
COPY src/ ${WORKDIR}
RUN curl -o wp-latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf  wp-latest.tar.gz --directory ${BUILDDIR} && \
	mv index.php ${BUILDDIR}
RUN chmod -R 777 ${BUILDDIR}
RUN sed 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.4/fpm/pool.d/www.conf
RUN curl -o  /usr/local/bin/wp-cli https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x /usr/local/bin/wp-cli
RUN rm  -rf /var/www/*
EXPOSE 9000
RUN cp -a ${BUILDDIR}. /var/www/ 

COPY src/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT  [ "sh", "/usr/local/bin/docker-entrypoint.sh" ]
