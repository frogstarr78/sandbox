require 'rubygems'
require 'treetop'
require 'colored'

Treetop.load "sql"

parser = SqlParser.new
puts parser.parse("this") ? 'succ' : 'fail'
puts parser.parse("this'") ? 'succ' : 'fail'
puts parser.parse("'this'") ? 'succ' : 'fail'
puts parser.parse("'this") ? 'succ' : 'fail'

a = [
'SELECT * FROM me;', 
'SELECT a FROM me;', 
'SELECT abc FROM me;', 
'SELECT a,b,c FROM me;', 
'SELECT a, b, c FROM me;', 
"SELECT a, 'a', b, c FROM me;", 
(<<-EOS
  SELECT a AS bob, 'b' as bob, 'c' as "BOB", B'1001', B'1010', B'1', B'0', B'01' FROM me;
EOS
),
(<<-EOS
  SELECT a AS bob, 'b'||'c'||'d' as "BOB" FROM me;
EOS
),
(<<-EOS
  SELECT *
  FROM
  me
EOS
),
( <<-EOS
 SELECT Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County"
FROM
 valid_orders_view V
 ...
EOS
),
( <<-EOS
 SELECT T.name AS "Trade Name", Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County", Z.msa AS "MSA ID", '"'||M.county||', '||M.state||'"' AS "MSA"
FROM
 valid_orders_view V
 ...
EOS
),
( <<-EOS
 SELECT T.name AS "Trade Name", Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County", Z.msa AS "MSA ID", '"'||M.county||', '||M.state||'"' AS "MSA", COUNT() as "Order Count"
FROM
 valid_orders_view V
 ...
EOS
)
]

a.each do |item|
  parsed = parser.parse(item)
  puts " parsing '#{item}'"
  if parsed
    puts 's'.green
    puts parsed.columns.to_a
#    puts parsed.columns.literals? ? parsed.columns.literals : parsed.columns
  else
    puts 'f'.red
  end
end
