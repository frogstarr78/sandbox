# Look out, there's a fire! FIRE! FIRE!
require 'robot'
require 'GardenHose'

class FireTruck < GardenHose
  def movement_state_machine
	if @last_reported_distance_to_enemy < 250
		flee_from_enemy if @ticks_since_last_seen < 3
	elsif @last_reported_distance_to_enemy > 350
		charge_enemy if @ticks_since_last_seen < 3
	else
		#stop
		spin_in_circle
	end
  end
end
