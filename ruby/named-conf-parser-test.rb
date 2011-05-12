#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubygems'

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
  def domain
    quoted_domain.name
  end

  def ip
    record_options.master_def.raw_ip.text_value
  end

  def is_comment?; false; end
  def record?; true; end
end

require 'treetop'
require 'named-conf-parser'

str = %Q(
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

	notify no;
};

zone "resiliencetrumpsaces.org" in {
        type slave;
        file "slaves/resiliencetrumpsaces.org";
        masters { 208.77.209.177; }; # first ip
};

#zone "sullivansouthwrestling.com" in {
#        type slave;
#        file "slaves/sullivansouthwrestling.com";
#        masters { 205.210.189.91; };
#};

zone "campbellsvillechristianchurch.com" in {
        type slave;
        file "slaves/campbellsvillechristianchurch.com";
#        masters { 205.210.188.123; };
        masters { 205.210.188.123; };
        transfer-source 208.77.208.2;//a comment
 };

zone "campbellsvillecc.com" in {
        type slave;
        file "slaves/campbellsvillecc.com"; 
        masters { 205.210.188.123; };# another comment
 };
)

#str = File.read '../tmp/life-named.conf'
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
  printf "%15s %s\n"% [item.ip, item.domain.text_value] #if item.record?
end
