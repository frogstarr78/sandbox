#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubygems'

module Comment
  def is_comment?; true; end
end

module Record
  def domain
    quoted_domain.name
  end

  def ip
    record_options.master_def.raw_ip.text_value
  end

  def is_comment?; false; end
end

require 'treetop'
require 'named-conf-parser'

str = %Q(
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

str = File.read '../tmp/life-named.conf'
str = File.read 'named.conf'

parser = NamedParser.new
parsed = parser.parse str.gsub /\s*(#|\/\/).*/, ''

if parsed.nil?
  puts "Unable to parse string"
  exit
end


#puts parsed.zone_records.elements[2].text_value #each {|rec| rec.text_value }
parsed.each_record do |item|
#  puts item.text_value, '-----------'
  printf "%15s %s\n"% [item.ip, item.domain.text_value]
end
