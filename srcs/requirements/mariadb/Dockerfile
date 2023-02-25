
FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y

WORKDIR /tmp/mariadb/

COPY src/ /tmp/mariadb/
COPY src/run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

RUN mkdir -p /run/mysql

RUN apt-get -qq install  dumb-init mariadb-common mariadb-common mariadb-server-10.5 -y

RUN service mariadb start && mariadb -u root < /tmp/mariadb/setup.sql


RUN 	sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/'\
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir tempmysql/
RUN cp -r /var/lib/mysql/* tempmysql

EXPOSE 3306
ENTRYPOINT [ "dumb-init","--" ]
CMD  [ "run.sh"]