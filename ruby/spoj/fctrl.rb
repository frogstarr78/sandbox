#!/usr/bin/env ruby

# reference: http://stackoverflow.com/questions/1174505/counting-trailing-zeros-of-numbers-resulted-from-factorial#answer-1175215
# http://en.wikipedia.org/wiki/Trailing_zeros
# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101
# 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  6,  6,  6,  6,  6,  7,  7,  7,  7,  7,  8,  8,  8,  8,  8,  9,  9,  9,  9,  9, 10, 10, 10, 10, 10, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22,  24,  24
#


def zeros_of factorial 
  i = 1
  res = 0
  while factorial >= i
    i *= 5
    res += factorial / i
#    puts "factorial #{factorial}", "i #{i}", "res #{res}"
  end
  res
end

@logic = proc do
  i = gets.strip.to_i
  puts "factorial #{i}"
  puts zeros_of( i )
  puts positional_figure( i )
  puts '-'*100
end

test_count = gets.strip.to_i

test_count.times &@logic

ints, zeros = [], []
(0..1025).each do |i|
  zeros << sprintf( "%0.4i", zeros_of( i ) )
  ints << sprintf( "%0.4i", i )
end
