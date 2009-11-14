require 'rubygems'
require 'treetop'
require 'colored'

Treetop.load "sql"

parser = SqlParser.new
parsed = parser.parse %Q(
       SELECT Z.total, TM.serviced, 100*TM.serviced/Z.total AS percent, TM.trade_name, contractor_id, company_name, county, state, TM.name
      FROM
        table
        ...
      )

if parsed
#  puts parsed.dot!
#  puts parsed.inspect
  puts parsed.columns.dot!
else
  puts 'f'.red
end
