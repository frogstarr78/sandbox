#!/usr/bin/env ruby

require 'test/unit/assertions'
include Test::Unit::Assertions


#puts f.methods.sort.collect(&:inspect)
#assert_equal 1, f.fac_0
#assert f.fac(0) == 1

#def fac 0
#  1
#end
#
#def fac n
#  n * fac( n - 1 )
#end

module RubyFac
  def fac n
    case n
    when 0
      1
    else
      n * fac( n - 1)
    end
  end
end
# include RubyFac
#  puts fac 4

module RubyFacExpanded
  def fac n
    return fac_0 if n == 0
    fac_n n
  end

  def fac_0
    1
  end

  def fac_n n
    n * fac( n - 1)
  end
end

#include RubyFacExpanded
#puts fac 0
#puts fac 1
#puts fac 2
#puts fac 3
#puts fac 4
#puts fac 5

class Functional
  attr_accessor :result
  define_method "==" do |result|
    @result = result
  end

  def define method, *arguments
    new_method_name = [method, arguments].flatten.join '_'
 
    self.class.send :define_method, new_method_name do
    end
  end
end

f = Functional.new
f.define(:fac, 0) == 1
