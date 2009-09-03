#!/usr/bin/ruby

"When the Fare Class is A,C,D,J,R, or Z then award 2 points"

class Points
  def initialize val
    @value = val
  end
  def to_s
    @value.to_s
  end
  def to_i
    @value
  end
end
class Integer
  def points
    Points.new(self)
  end
end

class FareClasses
  attr_accessor :points
  def award
    self.points = yield self, self.points
  end
end

class A < FareClasses; end
class C < FareClasses; end
class D < FareClasses; end
class J < FareClasses; end
class R < FareClasses; end
class Z < FareClasses; end

# ------------------------------------- end pseudo
#? context ?
context = A.new
context.award do |me, points|
  case me
    when A,C,D,J,R,Z
      points = 2.points
    else
      points = 0.points
  end
end
puts context.inspect
puts context.points
puts "-"*10

class FareClasses
  attr_accessor :points
  def award points
    self.points = points
  end

  def is *classes
    case self
      when *classes
        yield self
      else
        nil
    end
  end
end
context = J.new
context.is A,C,D,J,R,Z do |me|
  me.award 2.points 
end
puts context.inspect
puts context.points
puts "-"*10

# ------------------------------- example 2
