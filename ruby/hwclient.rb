require 'rubygems'
require 'zmq'

cmd=ENV['CMD']

context = ZMQ::Context.new(1)
requester = context.socket(ZMQ::REP)
requester.connect("ipc://localhost:5555")

cmd = requester.recv
#puts cmd
msg = %x|#{cmd}|
requester.send msg

requester.close
context.close
