#!/usr/bin/env ruby

def given! this
end

def when? that 
end

def then? what 
end

#given! @i = 1
#when? @i += 1
#then? @i == 2

class Fixnum
  define_method "+=" do |i|
    self + i
  end
end

class W5ht 
  attr_accessor :who, :what, :where, :when, :why, :how, :then
  # who? # object
  # what? # operator
  # where? # context
  # when? # temporal change
  # why? # evented change
  # how? # arguments
  # then! # value


  def initialize who, what, how, than, where = binding, wen = nil, why = nil
     @where = where
     if self.where.instance_variable_defined? who
       @who = self.where.instance_variable_get who
     else
       @who = self.where.instance_eval who 
     end
     @what  = what.to_sym
     @how   = how
     @then  = than
     @when  = wen
     @why   = why
  end

  def true? 
    eval == self.then
  end

  def eval 
    self.who.send self.what, self.how
  end
end

@i=0
huh = W5ht.new "@i", "+=", 1, 2
puts huh.true?
puts huh.eval
