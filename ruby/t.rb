#!/usr/bin/ruby

def tag(img, opts={})
	puts opts.inspect
	opts[:path] ||= 
	if img =~ %r{^https?://}
		''
	else
		'/images/'
	end
	puts opts.inspect
end

tag('here.jpg', :first => :second )
tag('here.jpg', :path => "where", :first => :second )

module Mod
  def one
    "This is one"
  end
  module_function :one
end
class Cls
  include Mod
  def callOne
    one
  end
end
puts Mod.one   #»   "This is one"
c = Cls.new
puts c.callOne   #»   "This is one"
module Mod
  def one
    "This is the new one"
  end
end
puts Mod.one   #»   "This is one"
puts c.callOne   #»   "This is the new one"
module Mod
  def one
    "This is the new new one"
  end

  module_function :one
end
puts Mod.one   #»   "This is one"
puts c.callOne   #»   "This is the new one"


def cba *q, &block
  yield block.call(*q)
end

r = cba 'b', 'c' do |*q|
  puts q
end

puts "r '#{r}' #{r == nil}"


module A
	class B
		attr_accessor :a, :b
		def initialize(a, b)
			puts a.inspect
			@a, @b = a, b
		end
	end

	def me
		B.new self, 'b'
	end
end

class C
	include A
end

ab = A::B.new 'a', 'b'
puts ab.inspect
puts A::B.inspect
ab = C.new.me
puts ab.inspect

def fun a
  case a
	  when 'a'
		  return a, 'b'
		else
		  return false
	end
end

a, b = fun 'b'
if a
  puts a, b
else
  puts 'nope', b
end

a, b = fun 'a'
if a
  puts a, b
else
  puts 'nope', b
end

class Integer
	def add other
		return self + 3 if other == 2
		self + other
	end
end

puts 2.add 1
puts 2.add 2
puts 2.add 3


puts '-'*60, 'recursive lambda', '-'*60

params = {
	:src => 'abc',
	:formName => 'form"s"',
	:customer => {
		:first_name => "bo'b",
		:last_name  => "smith\s"
	},
	:order => {
		:trade => 'roofing',
		:specialty => 'shingles "tile"'
	}
}

class String
  def remove_accents!
	self.gsub! /['"]/, ''
  end
end
def strip_accents params
  thunk = lambda do |key,value|
	case value
	  when String then value.remove_accents!
	  when Hash   then value.each(&thunk)
	end
  end
  params.each(&thunk)
end

puts strip_accents(params).inspect

class String
#  include Me
  def remove_accents!
	self.gsub! /['"]/, ''
  end
end
class Hash
  def strip_accents
	values.each {|val| 
	  val.is_a?(Hash) && val.strip_accents || val.remove_accents! 
	}
  end
end

puts params.strip_accents.inspect

def rexml_test
	require 'rexml/document'
	require 'fileutils'

	puts '-'*100
	rdir = %w(/ usr lib ruby ** index.html);
	out = '/var/www/localhost/htdocs/index.html'
	out = "#{ENV['HOME']}/public_html/ruby.html"
	template = "#{ENV['HOME']}/public_html/templates/xhtml10.html"
	f = File.open(template).read
	#puts f
	out_src = REXML::Document.new f
	body = out_src.root.elements["body"]
	olist = body.add_element 'ol'

	packages = {}
	Dir.glob(File.join(rdir)).sort.each do |filename|
	  File.dirname(filename).split(/\//).each {|dir|
		if dir =~ /^[a-zA-Z_][^\-]*\-[0-9].*$/
	#	  puts "ln -s #{File.dirname(filename)} #{File.join(File.dirname(out), dir)}"
	#	  FileUtils.ln_s File.dirname(filename), File.join(File.dirname(out), dir), :force => true
		  package, version = dir.split('-')
		  packages[package] ||= []
		  packages[package] << [version, filename]
		  packages[package].sort.uniq!
		end
	  }
	end

	packages.keys.sort.each do |pkg|
	  li = olist.add_element REXML::Element.new('li')
	  li.add_text "#{pkg} "
	  packages[pkg].each do |ver, dir|
		el = REXML::Element.new 'a'
	#	dir = "#{pkg}-#{ver}"
		li.add_text "( "
	#	el.add_attributes('href' => "#{dir}/index.html", 'id' => dir)
		el.add_attributes('href' => "file://#{dir}", 'id' => "#{pkg}-#{ver}")
		el.add_text ver
		li.add_element el
		li.add_text " )"
	  end
	end
	#puts body

	f = File.open out, 'w'
	out_src.write f
	f.close
end


class Alias_method_funk
	class Ab
		def a o='a'
			puts 'a' << o
		end
		alias_method :b, :a
	end

	a = Ab.new
	a.a
	a.b
	a.b 'b'

	class Ab
	#	def self.alias_method old, new, &blk
	#		if block_given?
	#			super( yield old, new)	
		def self.alias_method old, new, *args
			unless args.empty?
				super( old, new)	
			else
				super
			end
		end
	end

	a = Ab.new
	a.a
	a.b
	Ab.alias_method :c, :a
	a.c 'c'
	a.c
	Ab.alias_method :d, :a, 'g'
	#a.d
	m = proc { puts 'm' }
end


class Ab
	p = lambda { puts "hoho"; return 1 }
	define_method(:a, &p)
end

a = Ab.new
a.a

class Ac
	p = proc { |m| puts "hoho #{m}" }
#	define_method(:a, &p)
	def a m
		self.send(:p, m)
	end
end

a = Ac.new
a.a 'ac'

class IO
	def puts? *args
		args.each {|arg|
			puts arg unless arg.nil?
		} unless args.empty?
	end
end
#IO.send("define_method", :puts?, lambda { |*args| puts args unless args.empty? })
#$stdout.class.send("define_method", :puts?, lambda { |*args| puts args unless args.empty? })
#def IO.puts? *args
#	puts args unless args.empty?
#end
puts $stdout.class.public_instance_methods.sort

puts 'abc', 'def'
$stdout.puts? 'abc', 'def'
puts '-'*10
$stdout.puts? 'abc', nil, 'def'
puts 'abc', nil, 'def'


m = 1
n = DateTime.new(2009, m)
1
2
0
require 'enumerator'
(1..12).each_slice(3) do |m|; 
  puts DateTime.new(2009, n.month+[-2, 0, -1][n.month%3])..DateTime.new(2009, n.month+[0, 2, 1][n.month%3])
  sum = m.inject(0) {|l,r| l+=r }
  puts "sum #{sum} lcd #{sum/3} mod #{sum%3} 4mod #{sum%4}"
  m.each do |i|
    puts "emod #{i%3} emod4 #{i%4}"
  end
  puts m.inject(0) {|l,r| l+=r%4}
  puts m.inject(0) {|l,r| l+=r%12}
  puts m.inject(0) {|l,r| l+=r%30}
end
