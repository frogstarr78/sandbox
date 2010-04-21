#!/usr/bin/env ruby

require 'rubygems'
require 'ruby_parser'
require 'pp'

parser = RubyParser.new
ast = parser.parse %|
	def plus_five(n)
		n + 5
	end
|

pp ast
