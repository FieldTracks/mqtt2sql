#!/bin/sh

export MQTT_HOST='mqtts://t470:@mqtt.jluehr.de'
export DB_HOST='localhost'
export DB_USER='jellingstone'
export DB_PASS=''
export DB_DB='jellingstone'
ruby mqtt2sql.rb
