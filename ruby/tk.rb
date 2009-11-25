#!/usr/bin/env ruby

require 'tk'
include Tk

#$: << "/usr/lib/tktray1.1/" #libtktray1.1.so
#require 'tktray'

#class Thisn
#root = Root.new do 
#	title "Hello world!"
#	width = 200
#	bind "Control-Key-q" do |event|
#	  p event
#		p event.methods
#	  exit
#	end
#	minsize(200, 200)
#end
#
##btn = TkButton.new do  
##	text "Quit"  
##	command { exit }  
##	configure :underline => 0
##	pack('side'=>'left', 'padx'=>10, 'pady'=>10)  
##end
#
#bar = TkMenu.new(root) 
#
#file = TkMenu.new(bar) 
#file.add('command', :label => "Open",   :command => proc { puts "Open..." }) 
#file.add('command', :label => "Close",  :command => proc { puts "Close..." }) 
#file.add(:separator) 
#file.add('command', :label => "Quit",   :command => proc { root.destroy }) 
#
#sys = TkMenu.new(bar) 
#sys.add('command',  :label => "Quit",     :command => proc { root.destroy }) 
#
#bar.add('cascade',  :label => "File",   :menu => file) 
#bar.add('cascade',  :label => "System", :menu => sys) 
#
#root.menu bar
#
##pwin = TkPanedWindow.new do
##	orient :vertical
##	relief :groove
##	pack :side => 'left'
##end
#end

class TkTray < TkObject
end

class OtherWorld < Tk::Toplevel
  def initialize parent = nil, keys = nil
    super parent, :title => 'Other World', :width => 400

    Tk::Tile::Label.new(self) { text "Please set customer for a project." }.pack :side => 'top', :fill => 'y'

    label = Tk::Tile::Label.new(self) { text "Company Name" }
    label.pack('side' => 'top', :fill => 'y')
    customer_combo  = Tk::Tile::TCombobox.new(self)
    customer_combo.values = %w(abc xyz)
    customer_combo.current = 0
    customer_combo.pack('side' => 'bottom', 'fill' => 'y')


    $customer_address = TkVariable.new '123 here st'
    Tk::Tile::Label.new(self) { text "Address" }.pack :side => 'top', :fill => 'y'
    address = Tk::Tile::Entry.new(self) do
      textvariable $customer_address
    end
    address.pack :side => 'bottom', :fill => 'y'


    $customer_zip = TkVariable.new '12345'
    Tk::Tile::Label.new(self) { text "Zip" }.pack :side => 'top', :fill => 'y'
    zip = Tk::Tile::Entry.new(self) do
      textvariable $customer_zip
      width 6
    end
    zip.pack :side => 'bottom', :fill => 'y'

    customer_combo.bind("<ComboboxSelected>") do
      selected_customer = customer_combo.get
      address.value     = selected_customer.address
      zip.value         = selected_customer.zip
    end

  end
end

class HelloWorld < Tk::Root
  def initialize parent = nil, keys = nil
    super parent, :title => 'Hello World', :width => 500

    bar = TkMenu.new(self) 

    file = TkMenu.new(bar) 
    file.add('command', :label => "Customers",   :command => proc { OtherWorld.new }) 
    file.add('command', :label => "Projects",  :command => proc { puts "Close..." }) 
    file.add(:separator) 
    file.add('command', :label => "Quit",   :command => proc { root.destroy }) 

    sys = TkMenu.new(bar) 
    sys.add('command',  :label => "Quit",     :command => proc { root.destroy }) 

    bar.add('cascade',  :label => "Manage",   :menu => file) 
    bar.add('cascade',  :label => "System", :menu => sys) 

    menu bar
  end
end

h = HelloWorld.new
Tk.mainloop
