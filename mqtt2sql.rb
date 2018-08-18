require 'rubygems'
require 'mqtt'
require 'json'
require './model.rb'

def handle(msg)
  d = JSON.parse(msg)
  se = StoneEvent.new(uuid: d['uuid'],
    major: d['major'],
    minor: d['minor'],
    timestmp: d['timestmp'],
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
MQTT::Client.connect('mqtts://t470:@mqtt.jluehr.de') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('/JellingStone/#') do |topic,message|
    #puts "#{topic}: #{message}"
    handle(message)
  end
end
