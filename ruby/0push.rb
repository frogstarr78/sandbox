#
#   Task worker in Ruby
#   Connects PULL socket to tcp://localhost:5557
#   Collects workloads from ventilator via that socket
#   Connects PUSH socket to tcp://localhost:5558
#   Sends results to sink via that socket
#

require 'rubygems'
require 'ffi-rzmq'

context = ZMQ::Context.new(1)

## Socket to receive messages on
#receiver = context.socket(ZMQ::PULL)
#receiver.connect("tcp://localhost:5557")

# Socket to send messages to
sender = context.socket(ZMQ::PUSH)
sender.connect("tcp://localhost:9558")

# Process tasks forever
#while true
#  msec = receiver.recv_string

#  # Simple progress indicator for the viewer
#  $stdout << "#{msec}."
#  $stdout.flush

#  # Do the work
#  sleep(msec.to_f / 1000)

  # Send results to sink
  sender.send_string("hello?")
#end

sender.close
context.close
