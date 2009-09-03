#!/usr/bin/ruby

require 'pcaplet' 
# create a sniffer that grabs the first 1500 bytes of each packet
network = Pcaplet.new('-s 1500') 

#filter = Pcap::Filter.new('tcp and dst port 80', network.capture)
filter = Pcap::Filter.new('tcp and dst port 2049', network.capture)

# add the new filter to the sniffer
network.add_filter(filter)

for p in network 
  puts p.tcp_data if filter =~ p
end
