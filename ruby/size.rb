#!/usr/bin/env ruby

module Size
  def b
    self
  end
  def B
    self * 8
  end
  def K
    self * 1024
  end
  def M
    (self * 1024).K
  end
  def G
    (self * 1024).M
  end

  def to_g
    "%0.1fG"% ( self / ( 1024 * 1024 * 1024 ) )
  end
end
class Fixnum
  include Size
end

class Float
  include Size
end

s = 16.K + 12.K + 1.8.G + 9.9.M + 268.M + 8.K + 17.M + 3.M + 45.M + 108.M + 561.M
puts s.to_g
