require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: ENV['DB_HOST'],
  username: ENV['DB_USER'],
  password: ENV['DB_PASS'],
  database: ENV['DB_DB'],
  encoding: 'utf8'
)

class StoneEvent < ActiveRecord::Base
  has_many :sensor_contacts
end

class SensorContact < ActiveRecord::Base
  belongs_to :stone_event
end
