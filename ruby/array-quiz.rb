#!/usr/bin/env ruby

a = %w(a b c)
b = %w(b a)
b = %w(a b)

a = %w(a b c) << b
b = %w(b a c)


#puts (a.sort & b.sort ) == b
eql = true
both = a.zip(b)
puts both.inspect
both.each do |(left, right)|
  if left.is_a? Array and right.is_a? Array
    left.each_with_index do |item, i|
      eql = ( item == right[i] )
    end
  elsif left.nil? or right.nil?
    eql = true
  elsif left.is_a? Array or right.is_a? Array
    eql = false
    break
  else
    eql = ( left == right )
  end
end
puts eql
