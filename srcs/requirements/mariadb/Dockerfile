
FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y

WORKDIR /tmp/mariadb/
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_NAME
ARG WORDPRESS_DB_HOST
ARG ROOTPASS
ENV ROOTPASS ${ROOTPASS}
ENV WORDPRESS_DB_NAME ${WORDPRESS_DB_NAME}
ENV WORDPRESS_DB_HOST ${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_PASSWORD ${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_USER ${WORDPRESS_DB_USER}
COPY src/ /tmp/mariadb/
COPY src/run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

RUN mkdir -p /run/mysql

RUN apt-get -qq install  dumb-init mariadb-common mariadb-common mariadb-server-10.5 -y

RUN service mariadb start &&   eval "echo \"$(cat /tmp/mariadb/setup2.sql)\""  | mariadb -u root 

RUN 	sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/'\
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir tempmysql/
RUN cp -r /var/lib/mysql/* tempmysql

EXPOSE 3306
ENTRYPOINT [ "dumb-init","--" ]
CMD  [ "run.sh"]
