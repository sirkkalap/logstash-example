#!/bin/bash
# docker run -d -P --link elastic:es --name logstash-kibana pblittle/docker-logstash
# 
# 
# 
# docker run -d 
# 
# 
# $ docker run -it --rm logstash logstash -e 'input { file { path => "/tmp/*.log" } } output { stdout { } }'

docker run -d --rm --link elastic:es -v "$PWD":/config-dir logstash logstash -f /config-dir/logstash.conf

