#!/bin/bash
set -e
 if [ !  -f /var/www/wordpress/wp-config.php ]; then
wp-cli core download --allow-root --path="/var/www/wordpress/" || true
wp-cli config create --allow-root --force --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbcollate="utf8_general_ci" --dbcharset="utf8"  --path="/var/www/wordpress/"
wp-cli core install --allow-root --title="Wordpress" --admin_user=$WORDPRESS_DB_USER  --admin_password=$WORDPRESS_DB_PASSWORD  --admin_email="jp@rat.com" --path="/var/www/wordpress/" --url="https://localhost/" 
wp-cli user create $AUTHOR $AUTHORMAIL --role=author  --user_pass=$AUTHORTPASS --allow-root --path="/var/www/wordpress/"

echo "fully installed wordpress now launching wordpress"  
php-fpm7.4 -F -R
fi
echo "launching wordpress"
wp-cli config create --allow-root --force --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbcollate="utf8_general_ci" --dbcharset="utf8"  --path="/var/www/wordpress/"
wp-cli core install --allow-root --title="Wordpress" --admin_user=$WORDPRESS_DB_USER  --admin_password=$WORDPRESS_DB_PASSWORD  --admin_email="jp@rat.com" --path="/var/www/wordpress/" --url="https://localhost/" 
wp-cli user create $AUTHOR $AUTHORMAIL --role=author  --user_pass=$AUTHORTPASS --allow-root --path="/var/www/wordpress/"

sleep 8 && php-fpm7.4 -F -R


