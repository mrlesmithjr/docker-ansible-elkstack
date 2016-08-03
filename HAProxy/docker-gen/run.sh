#!/bin/bash
/usr/local/bin/docker-gen -notify-sighup ${PROJECT}_${SERVICE}_1 -watch /haproxy.tmpl /etc/haproxy/haproxy.cfg
