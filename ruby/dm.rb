require 'dm-core'

DataMapper.setup :default, "sqlite3://something.sqlite3"

class Something
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :name, String
  property :when_at, DateTime
end

Something.auto_migrate!
