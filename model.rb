require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  database: 'jellingstone',
  encoding: 'utf8',
  username: 'jellingstone',
  host: 'localhost',
  password: ''
)

class StoneEvent < ActiveRecord::Base
  has_many :sensor_contacts
end

class SensorContact < ActiveRecord::Base
  belongs_to :stone_event
end
