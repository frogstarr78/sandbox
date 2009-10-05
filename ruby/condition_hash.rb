#!/usr/bin/env ruby

#module HashLikeSmalltalkCond
#  class Object
#    def nil? hash
#      hash[:if_true].call
#      self
#    end
#  end
#
#  class NilClass
#    def nil? hash
#      hash[:if_false].call
#      self
#    end
#  end
#
#  class FalseClass
#    def nil? hash
#      hash[:if_false].call
#      self
#    end
#  end
#
#  bob = nil
#  bob.nil? :if_true => proc { puts 'true' }, :if_false => proc { puts 'false' }
#  bob = true
#  bob.nil? :if_true => proc { puts 'true' }, :if_false => proc { puts 'false' }
#  bob = false
#  bob.nil? :if_true => proc { puts 'true' }, :if_false => proc { puts 'false' }
#end

#module SymbolLikeSmalltalkCond
#  class Object
#    def nil? is_true, is_false
#      is_true.call
#      self
#    end
#  end
#
#  class NilClass
#    def nil? is_true, is_false
#      is_false.call
#      self
#    end
#  end
#
#  class FalseClass
#    def nil? is_true, is_false
#      is_false.call
#      self
#    end
#
#  end
#
#  module Kernel
#      def is_true 
#        Proc.new { yield }
#      end
#
#      def is_false
#        Proc.new { yield }
#      end
#  end
#
#
#  bob = false
#  bob.nil? is_true { puts 'y' }, is_false { puts 'n' }
#end

#module NilModLikeSmalltalkCond
  class Object
    def nil?
      yield :if_true, :if_false
    end
  end
#end

class Thing
  attr_accessor :a, :b

  def q
    yield a, b
  end
end


t = Thing.new
t.a = 'a'
t.b = 'b'
t.q {|a, b|
  puts "#{a} #{b}"
}
