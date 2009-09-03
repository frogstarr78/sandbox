#!/usr/bin/env ruby

require "rubygems"
gem "twitter4r"

require "twitter"

client = Twitter::Client.new(:login => "frogstarr78", :password => 'Un1-Ball')

timeline = client.timeline_for(:public) do |status| 
    puts "#{status.user.screen_name}: #{status.text}"
end
