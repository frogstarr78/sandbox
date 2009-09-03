#!/usr/bin/ruby

require 'set'

lines = ARGV.first.split("\n")

exit if lines.size < 2

class Col
  include Comparable
  attr_accessor :string, :size
  def initialize string
    @string, @size = string, string.size 
  end

  def <=> o
    [self.size, self.string.size, self.string] <=> [o.size, o.string.size, o.string]
  end
end

class Line
  include Enumerable
  attr_accessor :string, :size, :cols
  def initialize line, splitter=/(,\ ?)/
    @line, @size, @cols = line, line.size, line.split(splitter).collect{|col| Col.new(col) }
  end

  def [] i
    @cols[i]
  end

  def each &block
    @cols.each do |col|
	  yield col
	end
  end

  def collect &block
    @cols.each do |col|
	  yield col
	end
  end
end

class Lines
  attr_accessor :lines
  def initialize splitter=/(,\ ?)/, *lines
    @lines = lines.collect{|line| Line.new(line, splitter) }
  end

  def max_cols
    (0..max_line-1).collect do |i|
	  (sizes = @lines[i].collect do |line|
		puts @lines[i].inspect
	    @lines[i].size
	  end).sort
	  sizes.last
	end
  end

  private
	  def max_line
		(sizez = @lines.collect {|line| line.cols.size }).sort
		sizez.last 
	  end
end

diffs = Lines.new(/,/, *ARGV.first.split("\n"))

puts diffs.max_cols

#puts first_diff = indexes.first
#puts diffs.first.string[0...first_diff]
