FROM mrlesmithjr/haproxy:latest

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Copy docker-gen files
COPY docker-gen/ /app/

# Copy Ansible playbook to do configurations
COPY elk-haproxy.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-haproxy.yml

ENV DOCKER_HOST unix:///tmp/docker.sock

# Expose ports
EXPOSE 5044 5601 9090 9200 10514 10514/udp

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["docker-gen", "-config", "/app/docker-gen.cfg"]
