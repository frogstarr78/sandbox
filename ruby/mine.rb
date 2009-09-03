#!/usr/bin/ruby

$LOAD_PATH.unshift "../lib"
require 'postgres'
require 'postgres-pr/connection'

class DbBase
  @@connection = nil

  class << self 
		def connection
			@@connection
		end

		def connection= db, un=nil
			case db
				when PostgresPR::Connection
					@@connection = db
				when String
					@@connection = PostgresPR::Connection.new db, un
			end
			res = @@connection.query "select * from #{self.name.to_s.downcase}" # where username = 'simple'"

			class_eval do
				attr_accessor *res.fields.collect{|field| field.name.to_sym }
			end
		end
  end

  def initialize(attrs={})
    self.class.connection ||= PostgresPR::Connection.new 'scott', 'scott'
#    hvalues = res.rows.collect {|row|
#      ret = {}
#      res.fields.each_with_index{|col, idx|
#        ret.merge! col.name => row[idx]
#      }
#      ret
#    }
#    puts hvalues.inspect
  end

  def self.create(attr_and_vals={}, conn=nil)
		me = self.new
    me.id = self.connection.query("SELECT nextval('#{self.name.to_s.downcase}_id_seq')").rows.first.first
    attr_and_vals.each {|col, val|
      me.send "#{col}=", val
    }
		me
  end
end

klass = "ch10_passwords"
class Ch10_Passwords < DbBase
end

pg = PostgresPR::Connection.new('scott', 'scott')
#hvalues = res.rows.collect {|row|
#  ret = {}
#  res.fields.each_with_index{|col, idx|
#    ret.merge! col.name => row[idx]
#  }
#  ret
#}
#puts hvalues.inspect

pw = Ch10_Passwords.new
#puts pw.public_methods.sort
pw.username = 'bob'
pw.passwd = "bob's password"
puts pw.inspect
pw = Ch10_Passwords.create :username => 'bob', :passwd => "bob's password"
puts pw.inspect


class Klass
	def initialize
		@secret = 99
		@other  = 98
	end
end
k = Klass.new
puts k.instance_eval { @secret }
#puts k.instance_eval("other") { |var| var }

one, two = ['one', 'two']
puts two
puts one
