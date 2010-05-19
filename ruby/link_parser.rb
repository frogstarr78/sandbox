require 'linkparser' 

dict = LinkParser::Dictionary.new 
sent = dict.parse( "Ruby is a dynamic, open source programming language." ) 
puts sent.verb    # => "is.v" 
puts sent.subject # => 
puts sent.object  # => 
puts sent.constituent_tree_string 
# >> (S Ruby 
# > (VP is 
# > (NP (NP a dynamic) 
# > , 
# > (NP open source programming language .))))

sent = dict.parse 'The dog ran home.'
puts "verb '#{sent.verb}'"   # => "is.v" 
puts "subject '#{sent.subject}'" # => 
puts "object '#{sent.object}'"  # => 
puts sent.constituent_tree_string 

sent = dict.parse "Start the project Lunch/Break at 12:00."
puts "verb '#{sent.verb}'"   # => "is.v" 
puts "subject '#{sent.subject}'" # => 
puts "object '#{sent.object}'"  # => 
puts sent.constituent_tree_string 
