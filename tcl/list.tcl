#!/usr/bin/tcl

puts [ lsearch {a b c d e} c ]
puts [ lsearch -all {a b c a b c} c ]
puts [ lsearch -inline {a20 b35 c47} b* ]
puts [ lsearch -inline -not {a20 b35 c47} b* ]
puts [ lsearch -all -inline -not {a20 b35 c47} b* ]
puts [ lsearch -all -not {a20 b35 c47} b* ]
puts [ lsearch -all {a20 b35 c47 b36} b* ]
puts [ lsearch -start 3 {a b c a b c} c ]
puts [ lsearch {"a" "b" "c" "a" "b" "c"} "c" ]
puts [ lsearch {10022 22} "c" ]

puts "---------------"

proc sshPort { _list } {
	puts $_list
	set has_alt [ lsearch -glob $_list -a ]
	puts $has_alt
	if { $has_alt > 0 && $has_alt < 3} {
		return 10022
	} else {
		return 22	
	}
}


proc hasAltPort { _list opt } {
	set has_alt [ lsearch $_list $opt ]
	if { $has_alt < 3} {
		return $has_alt
	} else {
		return -1
	}
}

#puts [ sshPort { ns1 } ]
#puts [ sshPort { ns1 add_dns_entry host ip } ]
#puts [ sshPort { ns1 -n add_dns_entry host ip } ]
#puts [ sshPort { ns1 ls -a } ]
#puts [ sshPort { ns1 -n ls -a } ]
#puts [ sshPort { ns1 -n -a ls -a } ]
#puts [ sshPort { ns1 -a add_dns_entry host ip } ]
#puts [ sshPort { ns1 -n -a add_dns_entry host ip } ]
#
#
#puts [ hasAltPort { ns1 } ]
#puts [ hasAltPort { ns1 add_dns_entry host ip } ]
#puts [ hasAltPort { ns1 -n add_dns_entry host ip } ]
#puts [ hasAltPort { ns1 ls -a } ]
#puts [ hasAltPort { ns1 -n ls -a } ]
#puts [ hasAltPort { ns1 -n -a ls -a } ]
#puts [ hasAltPort { ns1 -a add_dns_entry host ip } ]
#puts [ hasAltPort { ns1 -n -a add_dns_entry host ip } ]

#puts [ lsearch { ns1 -n -a ls -a } -a ] 
#puts [ expr [ lsearch { ns1 -n -a ls -a } -a ] + 1 ]


puts [ expr [ hasAltPort { ns1 -a ls } -n ] == -1 ]
puts [ hasAltPort { ns1 -a ls } -n ]
