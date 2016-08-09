#!/bin/bash

sudo docker-compose scale elasticsearch_master=3 elasticsearch=2 logstash_processor=2 logstash_pre_processor=2 kibana=1

curl -X PUT http://localhost:9200/_cluster/settings -d '{"transient": {"discovery.zen.minimum_master_nodes": 2}}'
