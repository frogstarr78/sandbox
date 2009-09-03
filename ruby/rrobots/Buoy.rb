# Does absolutely nothing.
require 'robot'

class Buoy
	include Robot

	def tick events
		say "I'm an idiot."
	end
end
