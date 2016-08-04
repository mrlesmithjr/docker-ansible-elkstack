Info
====

Within this folder we will build our customized [Logstash] image. We will be
adding some custom configurations within the `config/` folder. We will be
creating them as individual purpose built configurations. All of the configurations
within this folder will be copied to into our image in the `/etc/logstash/conf.d`
folder. When [Logstash] launches it will load all of the configurations within
this folder in order by numbering them. So for example our inputs `/config/000-inputs.conf`
will load first and our `/config/999-outputs.conf` will load last.

We also need to make sure to expose our input ports defined in `/config/000-inputs.conf`
within our `Dockerfile`.

Once you have everything configured the way you like you can build the new
[Docker] image.
```
docker build -t elk-logstash .
```

This image will be a local [Docker] image.

[Docker]: <https://www.docker.com/>
[Logstash]: <https://www.elastic.co/products/logstash>
