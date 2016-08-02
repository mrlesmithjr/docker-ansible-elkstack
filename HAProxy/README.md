Info
====

Within this folder we will build our customized [HAProxy] image. We need to
modify the `config/haproxy.cfg` to define our load balanced setup. Part of this
customization is executing the `elk-haproxy.yml` [Ansible] playbook. This
will do some additional customizations specifically in regards to `rsyslog`.
[Ansible] is already installed in the main `mrlesmithjr/haproxy` image.

We also customize our `docker-entrypoint.sh` to start rsyslogd on launch.

Once you have everything configured the way you like you can build the new
[Docker] image.
```
docker build -t elk-haproxy .
```

This image will be a local [Docker] image.

[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com/>
[HAProxy]: <http://www.haproxy.org/>
