FROM mrlesmithjr/kibana

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Define ES Host
ENV ELASTICSEARCH_URL="http://elk:9200"

# Copy Ansible playbook to do configuration
COPY elk-kibana.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-kibana.yml \
  --extra-vars "elasticsearch_url=$ELASTICSEARCH_URL"
