FROM mrlesmithjr/haproxy:latest

COPY docker-gen/ /app/

RUN chmod +x /app/*.sh

RUN touch /var/run/haproxy.pid

# Copy Ansible playbook to do configurations
COPY elk-haproxy.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-haproxy.yml

ENV DOCKER_HOST unix:///tmp/docker.sock

# Expose ports
EXPOSE 5044 5601 9090 9200 10514 10514/udp

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["docker-gen", "-config", "/app/docker-gen.cfg"]
