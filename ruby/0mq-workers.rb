require 'rubygems'
#require 'ffi-rzmq'
require 'zmq'

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

commands.size.times do |i|
  puts "starting worker #{i}"
  Process.detach(
    fork do 
#i = ARGV.first.to_i
      context = ZMQ::Context.new
      worker = context.socket(ZMQ::REP)
      url="ipc://*:555#{i}"
      url="tcp://*:555#{i}"
#      url="ipc://worker.ipc"
      worker.bind(url)
      request = worker.recv
#      request = worker.recv_string
#      puts "worker#{i} received request #{request}"
      msg = %x|#{request.strip}|
#      puts "worker#{i} sending response #{msg[-10..-1]}"
      worker.send(msg)
#      worker.send_string(msg)
#      res << "Recieved request from #{i}'th command \`#{request}\`. Data: #{request.inspect}"
      worker.close
      context.close
    end
  )
end
