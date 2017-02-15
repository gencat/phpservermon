FROM nginx:1.9.2

COPY vhost.conf /etc/nginx/conf.d/default.conf

#Copiem el fitxer wait-for-it
COPY wait-for-it.sh /
RUN chmod 755 /wait-for-it.sh