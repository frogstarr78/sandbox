require 'rubygems'
require 'dm-core'
require 'pratt_dsl'

DataMapper.setup :default, "sqlite3:pratt_dsl_example.sqlite3"

class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true

  def self.named name
    first :name => name
  end
end

DataMapper.auto_migrate!

proj = Project.new
proj.attributes = { :name => 'Lunch/Break' }
proj.save

proj = Project.new
proj.attributes = { :name => 'Research' }
proj.save

module Pratt::Dsl
  class OrmLookup < Treetop::Runtime::SyntaxNode

    def to_o
      Project.named text_value
    end
  end
end
