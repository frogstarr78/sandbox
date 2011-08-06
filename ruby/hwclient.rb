require 'rubygems'
require 'zmq'

context = ZMQ::Context.new(1)

#Socket to talk to server
puts "Connecting to hello world server..."
requester = context.socket(ZMQ::REQ)
requester.connect("ipc://localhost:5555")

0.upto(6) do |request_nbr|
  puts "Sending request #{request_nbr}..."
  requester.send "Hello"

  reply = requester.recv
  puts "Received reply #{request_nbr}: [#{reply}]"
end

requester.close
context.close
