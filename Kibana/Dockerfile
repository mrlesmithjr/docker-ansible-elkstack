FROM mrlesmithjr/kibana:latest

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Define ES Host
ENV kibana_elasticsearch_url="http://elk:9200"

# Copy Ansible playbook to do configuration
COPY elk-kibana.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-kibana.yml \
  --extra-vars "kibana_elasticsearch_url=$KIBANA_ELASTICSEARCH_URL"
