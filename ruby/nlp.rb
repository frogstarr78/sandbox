#!/usr/bin/ruby

require 'linkparser' 

class String
  def is other
    self.send '=', other
  end
end

class Symbol
end

class Integer
end


dict = LinkParser::Dictionary.new 
sent = dict.parse( "Roofing is a type of trade." )

puts "subject #{sent.subject}"
puts "verb    #{sent.verb}"
puts "object  #{sent.object}"

puts '-'*10
#puts sent.public_methods.sort
puts sent.linkages.first.links
puts '-'*10
puts sent.linkages.last.words
puts sent.constituent_tree_string
