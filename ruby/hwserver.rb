require 'rubygems'
require 'zmq'

context = ZMQ::Context.new(1)

puts "Starting Hello World server..."

#socket to listen for clients
socket = context.socket(ZMQ::REP)
socket.bind("ipc://localhost:5555")

max_clients = 5
num_clients = 0
while num_clients != max_clients do
  # Wait for next request from client
  request = socket.recv

  puts "Recieved request. Data: #{request.inspect}"

  # Do some 'work'
  sleep 1

  # Send reply back to client
  socket.send("world")
  num_clients += 1
end

socket.close
context.close
