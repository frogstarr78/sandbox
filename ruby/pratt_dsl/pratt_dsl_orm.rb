require 'rubygems'
require 'dm-core'
require 'pratt_dsl'
require 'chronic'

DataMapper.setup :default, "sqlite3:pratt_dsl_example.sqlite3"

class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true

  has n, :whences

  def self.named name
    first :name => name
  end

  def start when_to
    whences.new :start_at => when_to
  end

  def has_start?
    true
  end
end

class Whence
  include DataMapper::Resource

  property :id,       Serial
  property :start_at, DateTime
  property :end_at,   DateTime
  property :invoiced, Boolean, :default => false

  belongs_to :project

  def self.last_unended
    last :end_at.eql => nil
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
  module OrmMethods
    def to_sym
      to_s.to_sym
    end

    def to_s
      text_value.downcase
    end
  end

  class OrmModel < Treetop::Runtime::SyntaxNode
    def to_s
      text_value
    end

    def find
      Project.named text_value
    end
  end

  module TemporalValue #< Treetop::Runtime::SyntaxNode
    def value
      Chronic.parse literal.text_value
    end
  end
end
