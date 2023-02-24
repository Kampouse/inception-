FROM debian:buster 

RUN apt-get update && \
	apt-get upgrade -y
RUN apt-get install nginx curl openssl  -y
WORKDIR /tmp/
ENV BUILDDIR=/tmp/build/
RUN mkdir ${BUILDDIR}
COPY src/ ${WORKDIR}
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/sslcert.crt \
        -keyout /etc/nginx/ssl/sslcert.key \
        -subj "/C=CA/ST=Quebec/L=Quebec City/O=42School/OU=42Quebec/CN=jemartel.42.fr"
RUN  rm -rf /etc/nginx/sites-enabled/* && \ 
mv  nginx.conf  /etc/nginx/sites-available/nginx.conf && \
ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE  443
RUN chmod -R 777 ${BUILDDIR}
CMD cp -a ${BUILDDIR}. /var/www/ && \
	nginx -g 'daemon off;'