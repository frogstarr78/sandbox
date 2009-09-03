require 'postgres-pr/connection'

#conn = PostgresPR::Connection.new('qualitysmith', 'qualitysmith')
#res = conn.query("select * from permissions where id_type = 'user' and id = '20'")
#puts res.rows.inspect
#puts res.rows.first[2].class

require "dbi" 
begin 
	dbh = DBI.connect("DBI:Pg:qualitysmith:localhost", "qualitysmith", "LoifdyYonyu4") 
	# get server version string and display it 
	row = dbh.select_one("SELECT VERSION()") 
	puts "Server version: " + row[0] 
rescue DBI::DatabaseError => e
	puts "An error occurred" 
	puts "Error code: #{e.err}" 
	puts "Error message: #{e.errstr}" 
ensure 
	# disconnect from server 
	dbh.disconnect if dbh 
end
