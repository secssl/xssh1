#!/bin/bash
source /app/config.sh

service ssh start
cp /app/default.conf /etc/nginx/conf.d/default.conf
service nginx start

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log


