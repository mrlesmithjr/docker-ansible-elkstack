FROM mrlesmithjr/logstash:latest

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Copy new configurations
COPY config/ /etc/logstash/conf.d

# Expose ports
EXPOSE 5044 10514 10514/udp
