#!/bin/bash
echo 'Exec...' >> /root/cron_exec.log
export MYSQLPSM_ENV_MYSQL_DATABASE=phpservermon
export MYSQLPSM_ENV_MYSQL_PASSWORD=phpservermon
export MYSQLPSM_ENV_MYSQL_USER=phpservermon
export MYSQLPSM_PORT_3306_TCP_ADDR=mysqlpsm
/usr/local/bin/php /var/www/public/cron/status.cron.php &>> /root/cron_exec.log
