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

#resp_ctx = ZMQ::Context.new
#resp_soc = resp_ctx.socket(ZMQ::PULL)
#resp_soc.connect("ipc://resp.ipc")

pids = []
cmds.each_with_index do |cmd, i|
    Process.detach( fork do 
      context = ZMQ::Context.new
      collector = context.socket(ZMQ::REQ)
      collector.connect("tcp://localhost:555#{i}")

      resp_sink = context.socket(ZMQ::PUSH)
      resp_sink.connect("ipc://resp.ipc")
      puts "client requesting cmd#{i} \`#{cmd}\`"
      collector.send cmd
      resp = collector.recv
#      puts "client received resp#{i} #{resp}"
##      res << resp
      puts "pushing #{resp} from cmd #{cmd} to sink"
      resp_sink.send resp
      resp_sink.close
      collector.close
      context.close
    end )
end

#puts pids.inspect
#
#pids.each do |pid|
#    Process.detach( pid )
#end

#pull_resp = resp_soc.recv
#puts "pull response #{pull_resp.inspect}"
#res << pull_resp
#
##mk_req.call
#
#resp_soc.close
#resp_ctx.close

#puts res.inspect, res.collect(&:inspect)
