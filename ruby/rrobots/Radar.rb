# Does absolutely nothing.
require 'robot'
require 'Buoy'

class Radar < Buoy
	include Robot

	def tick events
	  fire 0.3
	  turn_gun 2
	  say "Are you there?"
	end
end
