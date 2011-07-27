require "zmq"

context = ZMQ::Context.new(1)

puts "Opening connection for READ"
inbound = context.socket(ZMQ::UPSTREAM)
inbound.bind("ipc://127.0.0.1")

outbound = context.socket(ZMQ::DOWNSTREAM)
outbound.connect("ipc://127.0.0.1")
p outbound.send("Hello World!")
p outbound.send("QUIT")

loop do
    data = inbound.recv
    p [data, data == "QUIT"].inspect
    if data == "QUIT"
      outbound.close
      inbound.close
      break
    end
end

context.close()
