#!/usr/bin/env ruby

module HashLikeSmalltalkConditionals
  class ::Object
    def nil? hash
      hash[:if_false].call
      self
    end
  end

  class ::NilClass
    def nil? hash
      hash[:if_true].call
      self
    end
  end

  def run_example bob
    bob.nil? :if_true => proc { puts 'true' }, :if_false => proc { puts 'false' }
    yield bob if block_given?
  end
end

include HashLikeSmalltalkConditionals
run_example nil
run_example false

module MethodsLikeSmalltalkConditionals
  module Kernel
    def is_true 
      Proc.new { yield }
    end

    def is_false
      Proc.new { yield }
    end
  end

  class ::Object
    def nil? is_true, is_false
      is_false.call
      self
    end
  end

  class ::NilClass
    def nil? is_true, is_false
      is_true.call
      self
    end
  end

  include Kernel

  def run_example bob
    bob.nil? is_true { puts 'nil' }, is_false { puts 'notnil' }
    yield bob if block_given?
  end
end

include MethodsLikeSmalltalkConditionals

run_example nil do |who|
  who = false
  who.nil? is_true { puts 'true' }, is_false { puts 'false' }
end
