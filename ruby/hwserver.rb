require 'rubygems'
require 'zmq'

cmds = %W(ls\ $HOME
ls\ $HOME/tmp
ls\ /tmp
ls\ $HOME/git/vivio/
ls\ $HOME/git/vivio/tmp)


cmds.size.times do |i|
  Process.detach(
    fork { 
#      puts cmds[i]
      context = ZMQ::Context.new(1)
      requester = context.socket(ZMQ::REP)
      requester.connect("ipc://localhost:5555")

      cmd = requester.recv
#      puts cmd
      msg = %x|#{cmd}|
      requester.send msg

      requester.close
      context.close

#      %x|ruby hwclient.rb| 
    } 
  )
end


context = ZMQ::Context.new(2)
socket = context.socket(ZMQ::REQ)
socket.bind("ipc://localhost:5555")

max_clients = 5
num_clients = 0

cmds.each do |cmd|
#cmds.size.times do |i|
  socket.send(cmd)
  sleep 1
  request = socket.recv
  puts "Recieved request. Data: #{request.inspect}"
end

#while num_clients != max_clients do
#  puts "requesting #{cmds[num_clients]}"
#  socket.send(cmds[num_clients])
#  sleep 1
#  request = socket.recv
#
#  puts "Recieved request. Data: #{request.inspect}"
#
#  num_clients += 1
#end

socket.close
context.close
