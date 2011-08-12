require 'rubygems'
#require 'zmq'
require 'ffi-rzmq'

commands = [
  'date; ls $HOME',
  'date; ls $HOME/tmp; sleep 3',
  'date; ls /tmp',
  'date; sleep 5; ls $HOME/git/vivio/',
  'date; ls $HOME/git/vivio/tmp'
]
#commands = [
#  'ls $HOME',
#  'ls $HOME/tmp',
#  'ls /tmp',
#  'ls $HOME/git/vivio/',
#  'ls $HOME/git/vivio/tmp'
#]
cmds=commands


res = []

#commands.size.times do |i|
#  puts "starting worker #{i}"
#  Process.detach(
#    fork do 
#      context = ZMQ::Context.new
#      worker = context.socket(ZMQ::REP)
#      worker.bind("ipc://localhost:555#{i}")
#      request = worker.recv
#      puts "received request #{request}"
#      msg = %x|#{request}|
#      puts "sending response #{msg[-10..-1]}"
#      worker.send(msg)
##      res << "Recieved request from #{i}'th command \`#{request}\`. Data: #{request.inspect}"
#      worker.close
#      context.close
#    end
#  )
#end

context = ZMQ::Context.new
collector = context.socket(ZMQ::REQ)
#collector.connect("ipc://*:5555")
#commands.size.times {|i| collector.connect("tcp://*:955#{i}") }

#poller = ZMQ::Poller.new
#poller.register(collector, ZMQ::POLLIN)

#mk_req = lambda {
  cmds.each_with_index do |cmd, i|
#    collector = context.socket(ZMQ::XREQ)
    url = "ipc://localhost:555#{i}"
    url = "tcp://localhost:555#{i}"
    url = "ipc://localhost:5555"
    collector.connect(url)
    puts "client requesting cmd \`#{cmd}\`"
    collector.send_string cmd
    resp = collector.recv_string
    puts "client received resp #{resp}"
    res << resp
#    collector.close
  end
#}

#mk_req.call

collector.close
context.close

puts res.collect(&:inspect)
