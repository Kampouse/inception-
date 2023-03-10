CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$WORDPRESS_DB_USER'@'localhost';
SET PASSWORD FOR '$WORDPRESS_DB_USER'@'localhost' = PASSWORD('$WORDPRESS_DB_PASSWORD');


GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_DB_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';
GRANT ALL ON wordpress.* to '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';

FLUSH PRIVILEGES;

CREATE USER 'Kampouse'@'localhost';
GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_DB_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';
GRANT ALL ON wordpress.* to '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';
SET PASSWORD FOR  'Kampouse'@'localhost' = PASSWORD('$WORDPRESS_DB_PASSWORD');
FLUSH PRIVILEGES;
 


CREATE USER 'superuser'@'localhost' IDENTIFIED BY '$ROOTPASS';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'superuser'@'%' IDENTIFIED BY '$ROOTPASS';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTPASS';
flush privileges;