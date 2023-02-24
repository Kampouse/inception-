FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql curl
WORKDIR /tmp/
ENV BUILDDIR=/tmp/build/
RUN mkdir ${BUILDDIR}
RUN mkdir -p /run/php
ENV  DB_NAME=wordpress
ENV  DB_USER=jemartel
ENV  DB_PASSWORD=strongPassword
ENV  DB_HOST=mariadb 
ENV  DB_CHARSET=utf8mb4
ENV  DB_COLLATE= 
#install lastest verision of wordpress from wordpress.org
COPY src/ ${WORKDIR}
RUN curl -o wp-latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf  wp-latest.tar.gz --directory ${BUILDDIR} && \
     mv wp-config.php ${BUILDDIR} && \
	mv index.php ${BUILDDIR}
RUN chmod -R 777 ${BUILDDIR}
RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf
RUN curl -o  /usr/local/bin/wp-cli https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x /usr/local/bin/wp-cli

EXPOSE 9000
CMD cp -a ${BUILDDIR}. /var/www/ && wp-cli core install --allow-root --title="Wordpress" --admin_name=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD  --admin_email="jp@rat.com" --path="/var/www/wordpress/" --url="https://localhost/" && php-fpm7.3 -F -R
