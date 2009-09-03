#!/usr/bin/ruby

require 'tk'

root = TkRoot.new do 
	title "Hello world!"
	width = 200
	bind "Control-Key-q" do |event|
	  p event
		p event.methods
	  exit
	end
	minsize(200, 200)
end

#btn = TkButton.new do  
#	text "Quit"  
#	command { exit }  
#	configure :underline => 0
#	pack('side'=>'left', 'padx'=>10, 'pady'=>10)  
#end

bar = TkMenu.new() 

file = TkMenu.new(bar) 
file.add('command', :label => "Open",   :command => proc { puts "Open..." }) 
file.add('command', :label => "Close",  :command => proc { puts "Close..." }) 
file.add(:separator) 
file.add('command', :label => "Quit",   :command => proc { root.destroy }) 

sys = TkMenu.new(bar) 
sys.add('command',  :label => "Quit",     :command => proc { root.destroy }) 

bar.add('cascade',  :label => "File",   :menu => file) 
bar.add('cascade',  :label => "System", :menu => sys) 

root.menu(bar)

pwin = TkPanedWindow.new do
	orient :vertical
	relief :groove
	pack :side => 'left'
end

Tk.mainloop
