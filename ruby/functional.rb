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

module OneFormDynamic
  class Functional
    attr_accessor :methods
  #  private.methods

    def initialize
      @methods = {}
    end

  #  def fac n
  #    case n
  #    when 0
  #      return fac_0 
  #    else
  #      return fac_n n
  #    end
  #  end
   
    def fac n
      return self.methods[n].call n
    end

    def define method, *arguments, &block
      new_method_name = [method, arguments].flatten.join '_'

      if arguments.first == :n
        self.methods.default = self.class.send :define_method, new_method_name do |n|
          yield n
        end
      end

      if block.arity <= 0 
        self.methods[arguments.first] = self.class.send :define_method, new_method_name do
          yield
        end
      end
    end
  end
end

#f = Functional.new
#f.define(:fac, 0) { 1 }
#f.define(:fac, :n) {|n| n * f.fac(n-1) }
#puts f.fac 0
#puts f.fac 4

#fac = lambda {|n| 
#}
#fac_0 = lambda { 1 }
#fac_n = lambda {|n| n * fac.call(n-1) }
#fac = lambda {|n| 
#  case n
#  when 0
#    return fac_0.call n
#  else
#    return fac_n.call n
#  end
#}

#puts fac.call 0
#puts fac.call 4

#class Pratt
#
#  def cli argument
#    instance_eval &argument
#  end
#
#  def console 
#    exec "irb"
#  end
#  def graph  
#    puts 'graphing'
#  end
#
#end
#
##graph.call
##console.call
#p = Pratt.new
#p.cli :graph
#p.cli :bob
#p.cli :console

require 'delegate'

module DelegateFunctional
  class Functional < SimpleDelegator
    def initialize
  #    @which = SimpleDelegator.new([])
      @fac_0 = proc { 1 }
      @fac_Integer = proc {|n| n * fac(n-1) }
      super @fac_0
    end

    def fac n
      my_lambda = instance_variable_get( "@fac_#{n == 0 ? 0 : Integer}" )
      __setobj__ my_lambda
      my_lambda.call(n)
  #    @which.__setobj__( my_lambda )
  #    @which.call
    end

  #  def define method_name, argument, &block
  #    unless self.respond_to? method_name
  #      self.class.send :define_method, method_name do |*arguments|
  #        @which.__setobj__ argument
  #      end
  #    end
  #    new_method_name = [method_name, argument].join '_'
  #    self.class.send :define_method, new_method_name do
  #      yield
  #    end
  #  end
  end
end

#f = Functional.new
##f.define(:fac, 0) { 1 }
##f.define(:fac, :n) {|n| n * f.fac(n-1) }
#puts f.fac 0
#puts f.fac 4


class Functional < SimpleDelegator
  attr_accessor :which
  def initialize
    @which  = {
#      [:fac, 0] => proc { 1 },
#      [:fac, Integer] => proc {|n| n * fac(n-1) },
    }
    super @which
  end

  def define base_name, arguments, &block
    unless self.respond_to? base_name
      self.class.send :define_method, base_name do |*arguments|
        my_lambda = find( :fac, *arguments )
        __setobj__ my_lambda
        my_lambda.call(*arguments)
      end 
    end
    raise "already defined #{base_name}(#{arguments})" if find(base_name, *arguments)
    @which.update [base_name, arguments].flatten => block
  end

  private 
    def find base_name, *arguments
      begin
        @which.fetch [base_name, arguments].flatten
      rescue IndexError
        argument_classes = arguments.collect {|argument| argument.class }
        @which[[base_name, argument_classes].flatten]
      end
    end
end

f = Functional.new
f.define( :fac, 0 ) { 1 }
f.define( :fac, 1 ) { 2 }
f.define( :fac, Fixnum ) {|n| n * f.fac(n-1) }
puts f.fac 0
puts f.fac 1
puts f.fac 4
