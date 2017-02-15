#FROM phundament/php:5.6-fpm-dev
FROM phundament/php-one:5.6-fpm
#FROM phundament/php-one:7.0-fpm
MAINTAINER Rex Addiscentis <raddiscentis@addiscent.com>

RUN adduser www-data root

RUN mkdir -p /var/www/public

COPY ./phpinfo.php /var/www/public/phpinfo.php

COPY ./phpservermon-3.1.1.tar.gz /

#INI - Aquestes comandes s'executaran des de dins del contenidor (workaround per a Bluemix)

#RUN tar -zxvf /phpservermon-3.1.1.tar.gz -C /var/www/public/ --strip-components=2
#RUN rm /phpservermon-3.1.1.tar.gz

#COPY ./psm_config.php /var/www/public/config.php

#FI - Aquestes comandes s'executaran des de dins del contenidor (workaround per a Bluemix)

COPY ./psm_config.php /psm_config.php

#RUN chown -R www-data:www-data /var/www/public
#RUN chmod -R 755 /var/www/public

# RUN mkdir -p /etc/service/php-fpm
# ADD start.sh /etc/service/php-fpm/run
# RUN chmod +x /etc/service/php-fpm/run

COPY ./php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY ./www.conf /etc/php5/fpm/pool.d/www.conf
COPY ./php.ini /etc/php5/fpm/php.ini

COPY ./etc-cron.d-tab-for-phpfpm.txt /etc/cron.d/phpservermon
RUN chown root:root /etc/cron.d/phpservermon
RUN chmod 600 /etc/cron.d/phpservermon

#Copiem el fitxer wait-for-it
COPY ./wait-for-it.sh /
RUN chmod 755 /wait-for-it.sh

EXPOSE 9000

VOLUME /var/www/public

RUN chown -R root:root /var/www/public
RUN chmod 777 /var/www/public