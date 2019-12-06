#!/bin/sh

apt-get update
apt-get -y install nginx

service nginx
