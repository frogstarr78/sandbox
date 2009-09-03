#!/usr/bin/ruby

require 'ldap' 

class Auth 
  attr_accessor :connection, :host, :port, :dn	

	def initialize(dn,host="localhost",port=389) 
		@host = host
		@port = port
		@dn = dn 
		@connection = nil
	end 
	
	def login(login, pass) 
		begin 
			conn = LDAP::Conn.new(host, port)
			conn.set_option( LDAP::LDAP_OPT_PROTOCOL_VERSION, 3 )
			conn.bind( login, pass )
			@connection = conn
		rescue => e
		  puts "Unable to connect to using ldap://#{login}:#{pass}@#{host}:#{port}"
			false
		end
	end

	def get_member_of(username)
		members_of = Array.new
		begin
				result = @connection.search2( @dn, LDAP::LDAP_SCOPE_SUBTREE, "cn=#{username}", ["memberOf"])
				result.first["memberOf"].each { |str|
					members_of << str.split(',')[0].split('=')[1] 
				}
		rescue => e
		end
		members_of
	end

	def close 
		@connection.unbind if @connection
	end 
end 

# testing the code 
auth = Auth.new("CN=Users,DC=QSWW,DC=com",'qswwdc01.qsww.com', 389)
auth.login("skeeter@QSWW.com", "aujseamGoy")
groups = auth.get_member_of("Scott Noel-Hemming")
puts groups.inspect
auth.close

auth = Auth.new("CN=people,DC=qualitysmith,DC=com",'mail.qualitysmith.com', 389)
auth.login("scott.noel-hemming@qualitysmith.com", "aujseamGoy")
groups = auth.get_member_of("Scott Noel-Hemming")
puts groups.inspect
auth.close
