FROM debian:bullseye

# Update package lists and install necessary packages
RUN apt update && apt upgrade -y

# Install PHP-FPM
RUN apt install -y php php-fpm php-mysql

RUN apt install curl -y

# Create the directory for your web application
RUN mkdir -p /var/www/html;

# Copy the PHP-FPM configuration file
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create the folder to enable PHP-FPM to start
RUN mkdir -p /run/php/
RUN chmod 733 /run/php/
RUN chown www-data:www-data /run/php/

COPY ./tools/script.sh /usr/local/bin/script.sh

# Expose the port that PHP-FPM will listen on (default: 9000)
EXPOSE 9000

# Change ownership of the web directory to root
RUN chown -R root:root /var/www/html

RUN chmod +x /usr/local/bin/script.sh

CMD ./usr/local/bin/script.sh