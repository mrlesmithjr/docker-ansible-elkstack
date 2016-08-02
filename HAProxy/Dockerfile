FROM mrlesmithjr/haproxy:latest

# Copy configuration
COPY config/haproxy.cfg /etc/haproxy/haproxy.cfg

# Copy Ansible playbook to do configurations
COPY elk-haproxy.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-haproxy.yml

# Setup entrypoint script
RUN rm /entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

# Expose ports
EXPOSE 5044 5601 9090 9200 10514 10514/udp
