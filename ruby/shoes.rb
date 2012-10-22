#!/usr/bin/env ruby

require 'rubygems'
require 'green_shoes'
require './systray'

ICONE_HAPPY  ="/usr/share/pixmaps/pidgin/emotes/tweak/smile.png"
ICONE_UNHAPPY="/usr/share/pixmaps/pidgin/emotes/small/crying.png"

def edit
  puts("gedit",__FILE__)
end
def doit
  @text.text = "done!"
  @st.file   = ICONE_UNHAPPY
end

#Shoes.app :title => 'Project', :width => 275, :height => 137 do
Shoes.app :title => 'Project' do
  @new_project = nil
  @add_new = nil
  @stacked = stack :top => 10, :left => 10 do
    para "What will you be working on?"

    flow do
      list_box :items => %W(Pratt Lunch/Break Presentation Ruby\ TkTray)
      button "Add" do
        @add_new.show
      end
    end

    flow do
      button "Start" do
      end

      button "Change" do
      end

      button "Quit" do
        quit
      end

      @add_new = edit_line do |me|
        puts me.text
      end
      @add_new.style :hidden => true
    end
  end


  @st = systray( 
    :icon => ICONE_HAPPY,
    "Edit..." => proc {|state| edit() },
    "Test..." => proc {|state| doit() },
    :quit => true
  )
  para   "Systray icon should be visible"
  @text = para
end
