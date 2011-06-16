#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubygems'
require 'ipaddr'

module NamedConf
  def each_record &block
    zone_records.elements.each &block
  end
end

module Config
  def record?; false; end
end

module Comment
  def is_comment?; true; end
  def record?; false; end
end

module Record
  def type
    record_options.type_def.elements[2].text_value
  end

  def file
    record_options.file_def.file_path.text_value
  end

  def domain
    quoted_name.name.text_value
  end

  def ip
    if slave?
      ip = record_options.elements[2].raw_ip.text_value
    else
      ip = '208.77.208.2'
    end
    @ip ||= IPAddr.new ip, Socket::AF_INET
  end

  def is_comment?; false; end
  def record?; true; end

  def master?
    self.type == 'master'
  end

  def slave?
    self.type == 'slave'
  end
end

require 'treetop'
require 'named-conf-parser'

file_path = $<

str = file_path.read

parser = NamedParser.new
parsed = parser.parse str

if parsed.nil?
  puts "Unable to parse string"
  exit
end


parsed.each_record do |item|
  printf "%15s %s\n"% [item.ip, item.domain] if item.slave? or item.master?
end
