#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

module Echo 
  def receive_data data
    send_data data
  end
end

EM.run {
  EM.start_server "0.0.0.0", 8001, Echo
}
