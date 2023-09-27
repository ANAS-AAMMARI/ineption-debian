#!/bin/sh

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# wp core config --allow-root 
wp config create --allow-root \
    --dbname=wordpress \
    --dbuser=anas \
    --dbpass=123456 \
    --dbhost=mariadb --skip-check

wp core install --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL 

wp user create --allow-root \
    $WP_USER \
    $WP_USER_EMAIL \
    --role=author \
    --user_pass=$WP_USER_PASS 

/usr/sbin/php-fpm7.4 -F