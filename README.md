Repo Info
=========
This repo will be used as a collection of [Docker] [ELK Stack] related things.
This will be an ongoing effort in regards to the info included.

Usage
-----
In order to use the included `docker-compose.yml` you will need to follow the
included info within the following folders first.

`Elasticsearch/README.md`

`HAProxy/README.md`

`Logstash/README.md`

Or.... I have made it simpler for consuming this and building the [Docker] images.
```
docker-compose build
```
Now the required [Docker] images should be present locally. To validate you
can do the following:
```
docker images
```
```
elk-haproxy                  latest              c84e6e36f33b        5 seconds ago       330 MB
elk-logstash                 latest              841af9fbd26a        15 seconds ago      561.9 MB
elk-elasticsearch            latest              45bd7c40fe9a        3 hours ago         492.8 MB
```

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
nodes. We can easily do that by the following:
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
[HAProxy]: <http://www.haproxy.org/>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
