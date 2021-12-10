FROM nginx:alpine

RUN apk add apache2-utils
RUN mkdir -p /home/app/web \
             /var/www/letsencrypt/.well-known/acme-challenge \
             /etc/letsencrypt/live/ \
             /var/www \
             /etc/nginx/secrets