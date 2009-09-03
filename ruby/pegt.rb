require 'rubygems'
require 'treetop'
require 'colored'

Treetop.load "arithmetic"

parser = ArithmeticParser.new
if parser.parse('1+2')
  puts 'success'
else
  puts 'failure'
end
#puts parser.parse('1+1').klass
#puts parser.index
puts parser.parse('1+2').elements.collect(&:inspect)
puts
puts parser.parse('1+2').multitive.inspect
puts parser.parse('1+2').additive.inspect
puts parser.instance_variables.sort
#puts parser.klass

puts parser.parse('1+2').value
puts parser.parse('(1+3)*4') ? 'y'.green : 'n'.red
#puts parser.parse('(1+3)*4').value
