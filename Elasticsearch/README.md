Info
====

Within this folder we will build our customized [Elasticsearch] image. The only
thing we are doing here is installing the `royrusso/elasticsearch-HQ` plugin. You
May add any additional plugins you may want to leverage.

Once you have everything configured the way you like you can build the new
[Docker] image.
```
docker build -t elk-elasticsearch .
```

This image will be a local [Docker] image.

[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com/>
[Elasticsearch]: <https://elastic.co>
