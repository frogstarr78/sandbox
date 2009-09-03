#!/usr/bin/ruby

require 'aspectr'
require 'aquarium'

class MAspect
#	include AspectR
	include Aquarium::DSL

	def bob says
		says.capitalize
	end

	def tom says
		says.capitalize
	end
	before :calls_to => [:bob, :tom] do |jp, o, *args|
		puts jp
#		puts o.send args.first
	end

end

m = MAspect.new
m.bob 'what'
m.tom 'where'
