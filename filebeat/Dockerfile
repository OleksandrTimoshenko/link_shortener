FROM docker.elastic.co/beats/filebeat:7.15.2
USER root
RUN rm /usr/share/filebeat/filebeat.yml
RUN mkdir /etc/django_logs/
RUN chmod 755 /etc/django_logs/