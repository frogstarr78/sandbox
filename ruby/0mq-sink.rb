require 'rubygems'
require 'zmq'
#require 'ffi-rzmq'

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

resp_ctx = ZMQ::Context.new
resp_soc = resp_ctx.socket(ZMQ::PULL)
resp_soc.connect("ipc://resp.ipc")

pull_resp = resp_soc.recv
puts "pull response #{pull_resp.inspect}"
res << pull_resp

resp_soc.close
resp_ctx.close

puts res.inspect, res.collect(&:inspect)
