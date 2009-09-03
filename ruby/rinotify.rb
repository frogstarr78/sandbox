#!/usr/bin/ruby

require 'rubygems'
gem 'RInotify'
require 'rinotify'


puts Object.constants.sort
n = RInotify.new
n.add_action 'a', 'b' do |action|
  puts action.inspect
end
n.show
