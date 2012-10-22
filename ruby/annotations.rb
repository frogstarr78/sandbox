#!/usr/bin/env ruby18

ARGF.each do |filename|
  filename.each do |line|
    if line =~ /\s*#\s?FIXME/ || line =~ /\s*#\s?TODO/
      puts "#{ARGF.filename}: #{line.lstrip}"
    end
  end rescue abort("unable to open file: #{filename}")
end
