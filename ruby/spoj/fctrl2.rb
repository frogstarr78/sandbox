#!/usr/bin/env ruby

@cache = [1]

def factoral n
  @cache << n * factoral(n - 1) if @cache[n].nil?
  @cache[n]
end

@logic = proc do
  puts factoral( gets.strip.to_i )
end

test_count = gets.strip.to_i

test_count.times &@logic
