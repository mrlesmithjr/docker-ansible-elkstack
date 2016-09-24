FROM mrlesmithjr/kibana:ubuntu-16.04-4.6.1

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Copy Ansible playbook to do configuration
COPY elk-kibana.yml /

# Execute Ansible playbook
RUN ansible-playbook -i "localhost," -c local /elk-kibana.yml
