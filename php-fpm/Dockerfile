FROM phundament/php-one:5.6-fpm
MAINTAINER Suport Cloud Gencat <suport.cloud@gencat.cat>
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN mkdir -p /var/www/public
#Copiar tots els fitxers
COPY ./phpinfo.php /var/www/public/phpinfo.php
COPY ./phpservermon-3.1.1.tar.gz /
COPY ./psm_config.php /psm_config.php
COPY ./php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY ./www.conf /etc/php5/fpm/pool.d/www.conf
COPY ./php.ini /etc/php5/fpm/php.ini
COPY ./etc-cron.d-tab-for-phpfpm.txt /etc/cron.d/phpservermon
COPY ./wait-for-it.sh /
COPY ./cron.sh /root/cron.sh
VOLUME /var/www/public
EXPOSE 9000
RUN \
  apt-get update && \
  apt-get -y install cron && \
  printf "*/5 * * * * /root/cron.sh\n" | tee -a /root/phpservermon && \
  chmod +x /root/phpservermon && \
  chmod +x /root/cron.sh && \
  adduser www-data root && \
  chown root:root /etc/cron.d/phpservermon && \
  chmod 600 /etc/cron.d/phpservermon && \
  chmod 755 /wait-for-it.sh && \
  chown -R root:root /var/www/public && \
  chmod 777 /var/www/public && \
  touch /var/log/cron.log && \
  crontab -u root /root/phpservermon
# Run the command on container startup
CMD ["/entrypoint.sh"]
