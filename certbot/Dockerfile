FROM ubuntu
WORKDIR /
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    TZ="Europe/Kyiv" \
    apt-get install -y python3-certbot-dns-route53 docker.io
COPY entrypoint.sh ./
EXPOSE 445