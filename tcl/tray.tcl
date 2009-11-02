package require Tk
package require tktray 1.1

wm title . "Feet to Meters" 
grid [ttk::frame .c -padding "3 3 12 12"] -column 0 -row 0 -sticky nwes
grid columnconfigure . 0 -weight 1
grid rowconfigure . 0 -weight 1

grid [ttk::entry .c.feet -width 7 -textvariable feet] -column 2 -row 1 -sticky we
grid [ttk::label .c.meters -textvariable meters] -column 2 -row 2 -sticky we

grid [ttk::button .c.calc -text "Calculate" -command calculate] -column 3 -row 3 -sticky w 
grid [ttk::label .c.flbl -text "feet"] -column 3 -row 1 -sticky w
grid [ttk::label .c.imglbl -image [image create photo imgobj -file "working.gif"]] -column 3 -row 1 -sticky e
grid [ttk::label .c.islbl -text "is equivalent to"] -column 1 -row 2 -sticky e

grid [ttk::label .c.mlbl -text "meters"] -column 3 -row 2 -sticky w
foreach w [winfo children .c] {
	grid configure $w -padx 5 -pady 5
}
focus .c.feet
bind . <Return> {calculate}
bind . <Control-q> {exit}

tktray::icon .tracon -image [image create photo imgobj -file "working.gif"]
bind .tracon <1> {show_me}

proc calculate {} {
	if {[catch {
		set ::meters [expr {round($::feet*0.3048*10000.0)/10000.0}]
	}]!=0} {
		set ::meters ""
	} 
}

proc show_me {} {
	set width 300
	set height 100
	set iconWidth 20
	set iconHeight 20
	set maxWidth [winfo screenwidth .] 
	set maxHeight [winfo screenheight .]

	set left [lindex [.tracon bbox] 0]
	if { [expr {$left + $width}] > $maxWidth } {
		set left [expr {$left - $iconWidth - $width}]	
	}
#	if {$left > [expr {$maxWidth / 2}]} {
##		set left [expr {$left - $width}]
#	} else {
##		set left [expr {$left + 19}]
#	}

	set top [lindex [.tracon bbox] 1]
	if { [expr {$top + $height}] > $maxHeight} {
		set top [expr {$top - $iconHeight - $height}]	
	}
#	if {$top > [expr {$maxHeight / 2}]} {
##		set top [expr {$top - $height}]
#	} else {
#	}

	puts "$maxWidth $maxHeight"
	puts "$left $top"
	tk::toplevel .topper
#	wm title .topper "What say you?"
	wm geometry .topper "${width}x$height+$left+$top"
	grid columnconfigure .topper 0 -weight 1
	grid rowconfigure .topper 0 -weight 1

	grid [ttk::label .topper.little -text "Little"] -column 0 -row 0 
	grid [ttk::label .topper.bigger -text "Much Bigger Label"] -column 0 -row 0
#	after 2000 raise .topper.little

	bind .topper <Control-w> {destroy .topper}
}
