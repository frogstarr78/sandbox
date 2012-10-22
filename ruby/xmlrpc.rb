#!/usr/bin/env ruby

require 'uri'
require 'net/https'
require 'xmlrpc/client'

def sample
  server = XMLRPC::Client.new2("http://xmlrpc-c.sourceforge.net/api/sample.php")
  result = server.call("sample.sumAndDifference", 5, 9)
  puts result
end


def find_something
  client = XMLRPC::Client.new "https://jaguar.viviotech.net:6607/", nil, nil, nil, nil, 'root', 'VPS!itwtg', true
  result = client.call "host.get_system_status_capabilities"
  puts result
end

def https_checker
  uri = URI.parse "https://master.viviotech.net:8887/"
  http = Net::HTTP.new uri.host, uri.port
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  http.start do 
    http.request_get uri.path do |res|
      puts res
    end
  end
end

find_something
