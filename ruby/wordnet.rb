#!/usr/bin/ruby

require 'wordnet' 
include WordNet::Constants 
lex = WordNet::Lexicon::new 
origins = lex.lookup_synsets( "shoe", Noun )
puts origins
