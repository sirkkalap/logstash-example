#!/bin/bash
# Run Elastic Search, Logstash and Kibana in Docker
BASEDIR=$(cd "$(dirname "$0")"; pwd)

ESDATA=$BASEDIR/esdata
LSCONF=$BASEDIR/conf
LSDATA=$BASEDIR/data

docker rm -f elasticsearch logstash >/dev/null 2>&1 # Clean up old containers

  #-v "$ESDATA":/usr/share/elasticsearch/data/elasticsearch \
docker run -d --name elasticsearch \
  elasticsearch:2.2_no_data_volume

docker run -d --name logstash \
  --link elasticsearch:elasticsearch \
  -v "$LSCONF":/config-dir \
  -v "$LSDATA":/data \
  logstash logstash -f /config-dir/logstash.conf
