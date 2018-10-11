require 'rubygems'
require 'mqtt'
require 'json'
require './model.rb'

MQTT_TOPIC_PREFIX = 'JellingStone/'

def handle(tpc, msg)
  d = JSON.parse(msg)
  se = StoneEvent.new(mac: tpc[MQTT_TOPIC_PREFIX.length,17],
    uuid: d['uuid'],
    major: d['major'],
    minor: d['minor'],
    timestmp: d['timestamp'],
    comment: d['comment'])
  se.sensor_contacts = []
  d['data'].each do |c|
    se.sensor_contacts << SensorContact.new(
      min: c['min'],
      max: c['max'],
      avg: c['avg'],
      remoteRssi: c['remoteRssi'],
      major: c['major'],
      minor: c['minor'],
      uuid: c['uuid'],
      mac: c['mac'],
    )
  end
  se.save!
end

# Publish example
#MQTT::Client.connect('test.mosquitto.org') do |c|
#  c.publish('test', 'message')
#end

# Subscribe example
MQTT::Client.connect(ENV['MQTT_HOST']) do |c|
  # If you pass a block to the get method, then it will loop
  c.get(MQTT_TOPIC_PREFIX + '+') do |topic,message|
    #puts "#{topic}: #{message}"
    handle(topic, message)
  end
end
