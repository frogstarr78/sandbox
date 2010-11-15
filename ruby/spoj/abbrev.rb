#!/usr/bin/env ruby

def reverse i
  i.to_s.reverse.to_i
end

@logic = proc do
  left, right = gets.strip.split /\ /
  puts reverse(reverse(left) + reverse(right))
end

test_count = gets.strip.to_i

test_count.times &@logic
