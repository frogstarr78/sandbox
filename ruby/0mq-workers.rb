require 'rubygems'
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
      worker = context.socket(ZMQ::XREP)
      url="ipc://*:555#{i}"
      url="tcp://*:555#{i}"
      url="ipc://*:5555"
      worker.bind(url)
      request = worker.recv
      puts "worker received request #{request}"
      msg = %x|#{request}|
      puts "worker sending response #{msg[-10..-1]}"
      worker.send(msg)
#      res << "Recieved request from #{i}'th command \`#{request}\`. Data: #{request.inspect}"
      worker.close
      context.close
    end
  )
end
