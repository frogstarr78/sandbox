#!/usr/bin/env ruby

@cache = [1]
def factoral n
  @cache << n * factoral(n - 1) if @cache[n].nil?
  @cache[n]
end

#214032
n=[0, 1, 2, 3, 4,    5,   6,    7,     8,      9,      10,       11,        12,         13,          14,            15,             16,              17,               18,                 19,                  20,                   21,                     22,                      23,                       24,                         25,                          26,                            26,                             27,                              28]
r=[0, 0, 0, 0, 0,    1,   1,    1,     1,      1,       2,        2,         2,          2,           2,             3,              3,               3,                3,                  3,                   4,                    4,                      4,                       4,                        4,                          6,                           6,                             6,                              6,                               6]
f=[1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600, 6227020800, 87178291200, 1307674368000, 20922789888000, 355687428096000, 6402373705728000, 121645100408832000, 2432902008176640000, 51090942171709440000, 1124000727777607680000, 25852016738884976640000, 620448401733239439360000, 15511210043330985984000000, 403291461126605635584000000, 10888869450418352160768000000, 304888344611713860501504000000, 8841761993739701954543616000000]

(0..30).each do |i|
  print factoral(i), ', '
end

a=[]


#test_count = gets.strip.to_i
#
#test_count.times &@logic
