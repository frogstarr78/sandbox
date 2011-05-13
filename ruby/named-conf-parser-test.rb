#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubygems'
require 'ipaddr'

module NamedConf
  def each_record &block
    elements.last.elements.each &block
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
    quoted_name.name
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

str = %Q(
// Red Hat BIND Configuration Tool
// 
// Default initial "Caching Only" name server configuration
//

options {
	directory "/var/named";
	dump-file "/var/named/data/cache_dump.db";
        statistics-file "/var/named/data/named_stats.txt";
	allow-query { any; };
        allow-query-cache { any; };

	allow-recursion {
		127.0.0.1;
		208.77.208.0/24;
		206.126.21.0/24;
		64.185.107.177/28;
		67.158.224.0/24;
		67.158.225.0/24;
		208.77.208.0/24;
		208.77.209.0/24;
		208.77.210.0/24;
		208.77.211.0/24;
		205.210.188.0/24;
		205.210.189.0/24;
		205.210.190.0/24;
		205.210.191.0/24;
	};


	/*
	 * If there is a firewall between you and nameservers you want
	 * to talk to, you might need to uncomment the query-source
	 * directive below.  Previous versions of BIND always asked
	 * questions using port 53, but BIND 8.1 uses an unprivileged
	 * port by default.
	 */
	 // query-source address * port 53;
	notify no;
};

logging {
	channel query_logging {
		file "/var/named/log/named_querylog"
			versions 3 size 100M;
		print-time yes;			// timestamp log entries
	};
	category queries {
		query_logging;
	};
	category lame-servers { null; };
};



zone "richardbessey.com" in {
        type slave;
        file "slaves/richardbessey.com";
        masters { 72.10.12.146; };
 };

# Reverse DNS files go here

zone "208.77.208.in-addr.arpa" in {
        type master;
        file "master/208.77.208.in-addr.arpa";
};
)

str = File.read '../tmp/life-named.conf'
#str = File.read 'named.conf'

parser = NamedParser.new
parsed = parser.parse str.gsub /\s*(#|\/\/).*/, ''

if parsed.nil?
  puts "Unable to parse string"
  exit
end


#puts parsed.methods.inspect #.elements[2].text_value #each {|rec| rec.text_value }
#puts parsed.zone_records.elements[2].text_value #each {|rec| rec.text_value }
parsed.each_record do |item|
#  puts item.text_value, item.methods.sort.inspect, '-----------' if !item.respond_to? :record?
  printf "%15s %s\n"% [item.ip, item.domain.text_value] if item.slave?
end
