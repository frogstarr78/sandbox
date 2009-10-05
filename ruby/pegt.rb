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
parsed = parser.parse('1+2')
puts parsed.elements.collect(&:inspect), 
parsed.inspect, 
'',
' multitive ' << parsed.multitive.inspect,
' additive ' << parsed.additive.inspect,
parsed.instance_variables.sort
#puts parser.klass

puts '-'*10
puts parser.parse('1+2').value
puts parser.parse('(1+3)*4') ? 'y'.green : 'n'.red
puts parser.parse('(1+3)').value
puts parser.parse('(1+3)*4').value
#puts parser.parse('(1+3)*4').value
