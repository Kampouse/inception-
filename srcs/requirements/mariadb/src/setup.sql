CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'jemartel'@'localhost';
SET PASSWORD FOR 'jemartel'@'localhost' = PASSWORD('mypassword');
GRANT ALL PRIVILEGES ON wordpress.* TO 'jemartel'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL ON wordpress.* to 'jemartel'@'%' IDENTIFIED BY 'mypassword';

FLUSH PRIVILEGES;

CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'superuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpass';

FLUSH PRIVILEGES;