#!/usr/bin/env ruby

require 'rubygems'  
require 'xmpp4r'  
include Jabber

username = 'frogstarr78'
password = '2MJatOTG15'
to_username = 'viviotech'  

puts "connecting to jabber server.."  
# Jab you want to see what's being sent and received!
# jid = JID::new('test@yeush.com/Testing')
jabber = Client::new("#{username}@gmail.com")
jabber.connect 'talk.google.com', 5222
jabber.auth(password)
exit

#jabber = Jabber::Simple.new("#{username}@gmail.com",password)  
puts "connected."  
#jabber.deliver(to_username+"@gmail.com", "Hello..!")  

to = "#{to_username}@gmail.com"
subject = "XMPP4R test"
body = "Hi, this is my first try from XMPP4R!!!"
m = Message::new(to, body).set_type(:normal).set_id('1').set_subject(subject)
jabber.send m

#while (true) do  
#  jabber.received_messages do |msg|  
#    puts "=================================================="
#    msg.body.downcase.strip == 'exit'  
#    puts msg.body  
#    puts "--------------------------------------------------"
#    stdout = IO.popen(msg.body).read  
#    jabber.deliver(to_username+"@gmail.com", stdout)  
#    puts stdout
#  end  
#end  
