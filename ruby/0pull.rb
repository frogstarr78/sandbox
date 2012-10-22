#
# Task sirnk in C
# Binds PULL socket to tcp://localhost:5558
# Collects results from workers via that socket
#

require 'rubygems'
require 'ffi-rzmq'

# Prepare our context and socket
context = ZMQ::Context.new(1)
receiver = context.socket(ZMQ::PULL)
receiver.bind("tcp://*:9558")

# Wait for start of batch
receiver.recv_string
tstart = Time.now

# Process 100 confirmations
while true
#100.times do |task_nbr|
  resp = receiver.recv_string
#  $stdout << ((task_nbr % 10 == 0) ? ':' : '.')
#  $stdout.flush
  puts resp
end

# Calculate and report duration of batch
tend = Time.now
total_msec = (tend-tstart) * 1000
puts "Total elapsed time: #{total_msec} msec"

receiver.close
context.close
