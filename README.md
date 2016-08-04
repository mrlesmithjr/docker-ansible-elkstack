Repo Info
=========
This repo will be used as a collection of [Docker] and [ELK Stack] related things.
This will be an ongoing effort in regards to the info included.

Usage
-----
In order to consume the [Docker] images to spin up the [ELK Stack] containers
run the following to build/pull the required images:
```
docker-compose build
```
Now the required [Docker] images should be present locally. To validate you
can do the following:
```
docker images
```
```
elk-haproxy                  latest              b8c9fa45f485        17 minutes ago      341.1 MB
elk-logstash-processor       latest              ac23cc31f5fd        18 minutes ago      561.9 MB
elk-logstash-pre-processor   latest              af8d6f655790        18 minutes ago      561.9 MB
elk-kibana                   latest              9878f952b2ad        About an hour ago   457.7 MB
elk-elasticsearch            latest              516e9a17ebb3        About an hour ago   490.5 MB
mrlesmithjr/redis            latest              a49bbdba303f        About an hour ago   330 MB
mrlesmithjr/elasticsearch    latest              531ba97a9a26        47 hours ago        456.1 MB
mrlesmithjr/logstash         latest              aaa1e770fa96        2 days ago          561.9 MB
mrlesmithjr/kibana           latest              245851383423        3 days ago          457.7 MB
mrlesmithjr/haproxy          latest              01cc117c6068        3 days ago          330 MB
```

Once the stack is up you can configure your devices to send syslog via UDP/10514
and watch the events start flowing into [Kibana] either by connecting to
http://127.0.0.1:5601 from your [Docker] host. Or by connecting to http://IPorHostname:5601
from another client browser.

Current ELK Flow:
-----------------
* elk-haproxy -> elk-logstash-pre-processor
* elk-logstash-pre-processor -> redis
* elk-logstash-processor <- redis
* elk-logstash-processor -> elk-elasticsearch

Compose
-------
To spin up the environment using `docker-compose` we can that by executing the
following:
```
docker-compose up -d
```
To check the containers status:
```
docker-compose ps
```
```
dockeransibleelkstack_elasticsearch_1       docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
dockeransibleelkstack_elasticsearch_maste   docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
r_1                                                                                                                                                                           
dockeransibleelkstack_haproxy_1             docker-entrypoint.sh hapro ...              Up                                          0.0.0.0:10514->10514/tcp,                 
                                                                                                                                    0.0.0.0:10514->10514/udp,                 
                                                                                                                                    0.0.0.0:5044->5044/tcp,                   
                                                                                                                                    0.0.0.0:5601->5601/tcp,                   
                                                                                                                                    0.0.0.0:9090->9090/tcp,                   
                                                                                                                                    0.0.0.0:9200->9200/tcp                    
dockeransibleelkstack_kibana_1              docker-entrypoint.sh kibana                 Up                                          5601/tcp                                  
dockeransibleelkstack_logstash_1            docker-entrypoint.sh logst ...              Up                                          10514/tcp, 10514/udp, 5044/tcp, 514/tcp,  
                                                                                                                                    514/udp
```

Scale
-----
What if we want to scale the [Elasticsearch] cluster and add some additional
** Non-Master ** data/client nodes. We can easily do that by the following:
```
docker-compose scale elasticsearch=4
```
Now if we look at our running containers:
```
docker-compose ps
```
```
dockeransibleelkstack_elasticsearch_1       docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
dockeransibleelkstack_elasticsearch_2       docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
dockeransibleelkstack_elasticsearch_3       docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
dockeransibleelkstack_elasticsearch_4       docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
dockeransibleelkstack_elasticsearch_maste   docker-entrypoint.sh elast ...              Up                                          9200/tcp, 9300/tcp                        
r_1                                                                                                                                                                           
dockeransibleelkstack_haproxy_1             docker-entrypoint.sh hapro ...              Up                                          0.0.0.0:10514->10514/tcp,                 
                                                                                                                                    0.0.0.0:10514->10514/udp,                 
                                                                                                                                    0.0.0.0:5044->5044/tcp,                   
                                                                                                                                    0.0.0.0:5601->5601/tcp,                   
                                                                                                                                    0.0.0.0:9090->9090/tcp,                   
                                                                                                                                    0.0.0.0:9200->9200/tcp                    
dockeransibleelkstack_kibana_1              docker-entrypoint.sh kibana                 Up                                          5601/tcp                                  
dockeransibleelkstack_logstash_1            docker-entrypoint.sh logst ...              Up                                          10514/tcp, 10514/udp, 5044/tcp, 514/tcp,  
                                                                                                                                    514/udp
```
If you need Multi-Master Elasticsearch scaling ** Non-Data ** nodes.
```
docker-compose scale elasticsearch_master=3
```

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com>
[Elasticsearch]: <https://www.elastic.co/products/elasticsearch>
[ELK Stack]: <https://www.elastic.co/products>
[HAProxy]: <http://www.haproxy.org/>
[Kibana]: <https://www.elastic.co/products/kibana>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
