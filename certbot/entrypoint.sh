#!/bin/bash

trap "exit" SIGHUP SIGINT SIGTERM

if [ -z "$DOMAINS" ] ; then
  echo "No domains set, please fill -e 'DOMAINS=example.com www.example.com'"
  exit 1
fi

DOMAINS=(${DOMAINS})
CERTBOT_DOMAINS=("${DOMAINS[*]/#/--domain }")
CHECK_FREQ="${CHECK_FREQ:-30}"

check() {
  echo "* Starting dns-route53 initial certificate request script..."

  certbot certonly --dns-route53 --noninteractive --agree-tos --email $EMAIL --text --expand \
      ${CERTBOT_DOMAINS}

  echo "* Certificate request process finished for domain $DOMAINS"

  if [ "$SERVER_CONTAINER" ]; then
    echo "* Reloading Nginx configuration on $SERVER_CONTAINER"
    eval docker kill -s HUP $SERVER_CONTAINER
  fi

  if [ "$SERVER_CONTAINER_LABEL" ]; then
    echo "* Reloading Nginx configuration for label $SERVER_CONTAINER_LABEL"

    container_id=`docker ps --filter label=$SERVER_CONTAINER_LABEL -q`
    eval docker kill -s HUP $container_id
  fi

  echo "* Next check in $CHECK_FREQ days"
  sleep ${CHECK_FREQ}d
  check
}

check