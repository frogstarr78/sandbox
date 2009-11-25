#!/usr/bin/env ruby


require 'rubygems'
require "wx" 
#require 'wxruby2'
#include Wx

class MinimalApp < App
  def on_init 
    Frame.new(nil, -1, "The Bare Minimum").show()
  end
end

MinimalApp.new.main_loop
