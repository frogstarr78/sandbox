start = config

config
	= options_config? logging_config? zone_records:zone_record+ { function each_record(callback) { zone_records.elements.each(callback) } }

zone_record
	= space* "zone" space+ quoted_name space+ "in" space+ open_curly space+ record_options close_curly semi space* <Record>

record_options
	= type_def file_def master_def?  transfer_source_def?

type_def
	= "type" space+ type:( "slave" / "master" / "forward" / "hint" / "stub" / "delegation-only" ) space* semi space+

file_def
	= "file" space+ file_path:quoted_name space?  semi space+

master_def
	= "masters" space+ open_curly space* raw_ipv4 space?  semi space* close_curly space?  semi space+

transfer_source_def
	= "transfer-source" space+ raw_ipv4 space?  semi space+

options_config
	= space* "options" space+ open_curly space+ options_options close_curly semi space*

options_options
	= directory_path:file_config_def dump_file:file_config_def statistics_file:file_config_def allow_query:net_allow_def allow_query_cache:net_allow_def transfer_source:host_allow_def allow_recursion:net_allow_def query_source_def?  notify_def:boolean_def

file_config_def
	= ( "directory" / "dump-file" / "statistics-file" ) space+ file_path:quoted_name space?  semi space+

host_allow_def
	= ( "transfer-source" ) space+ ( raw_ipv4 / '*' ) strict_port_def?  semi space+

strict_port_def
	= space+ 'port' space+ number+

loose_port_def
	= space+ 'port' space+ ( number+ / '*' )

net_allow_def
	= ( "allow-query-cache" / "allow-query" / "allow-recursion" ) space+ open_curly space* host_list_def close_curly space?  semi space+

host_list_def
	= 'any' space?  semi space* / ( raw_ipv4 space?  semi space* )*

query_source_def
	= 'query-source' space 'address' space '*' space 'port' space number+ space?  semi space+

boolean_def
	= ( 'notify' / 'print-time' ) space ( 'yes' / 'no' ) semi space+

logging_config
	= space* "logging" space+ open_curly space+ logging_options close_curly semi space*

logging_options
	= channel_def category_def+

channel_def
	= 'channel' space 'query_logging' space open_curly space+ log_file_def print_time:boolean_def close_curly semi space+

log_file_def
	= "file" space+ quoted_name space+ 'versions' space number space 'size' space number+ ( 'M' / 'G' / 'K' )? semi space+

category_def
	= 'category' space ( 'queries' / 'lame-servers' ) space open_curly space+ ( 'query_logging' / 'null' ) semi space+ close_curly semi space+

space
	= ( "\t" / " " / "\n" / comments ) space*

quoted_name
	= quote name:( !quote . )+ quote

quote
	= "\""

open_curly
	= "{"

semi
	= ";"

newline
	= "\n"

raw_ipv4
	= ( octet dot octet dot octet dot octet cidr? )+

octet
	= number 1..3 

cidr
	= '/' ( ( '3'  [0-2]  ) / ( '1'  number ) / ( '2'  number ) / ( '0'? number ) )

number
	= [0-9]

dot
	= '.'

close_curly
	= "}"

comments
	= sh_comment / cplus_comment / multiline_c_comment

sh_comment
	= '#' ( !newline . )*

cplus_comment
	= '//' ( !newline . )*

multiline_c_comment
	= '/*' ( !'*/' . )* '*/'
