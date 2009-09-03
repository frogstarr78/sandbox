#!/usr/bin/ruby

require 'optparse'
nostdout = 0
append = 0
unbuffer = 0
ignore_ints = 0

ARGV.options do |opt| 
  opt.on('-n') { nostdout +=1 } 
  opt.on('-a') { append +=1 } 
  opt.on('-u') { unbuffer +=1 } 
  opt.on('-i') { ignore_ints +=1 } 
  opt.parse!
end || abort("usage: " + __FILE__ + " [-ainu] [filenames]")


