# Good for spraying things down with water, but not much else.
require 'robot'

class GardenHose
  include Robot

  FullRotation = 360
  HalfRotation = FullRotation / 2
  QuarterRotation = HalfRotation / 2
  
  def tick events
    @current_events = events
    init_variables_at_start if time == 0
	init_variables_each_turn
	
	try_to_point_radar_toward_enemy
    unless @current_events['robot_scanned'].empty?
		turn_gun_to_match_radar
	end
	movement_state_machine

	turn @turn_collector
	turn_gun @turn_gun_collector
	turn_radar @turn_radar_collector
	# We're only firing at 0.1 power.  Fire all the time.
	fire 0.1
	#fire 0.1 if determine_turn_distance(radar_heading, gun_heading) < @max_gun_sweep
  end
  
  def init_variables_at_start
	@max_radar_sweep = 30
	@min_radar_sweep = 2
	@max_gun_sweep = 20
	@max_tank_sweep = 10
	@last_reported_distance_to_enemy = 65536
	@ticks_since_last_seen = 65536

	@radar_sweep = @max_radar_sweep
	@radar_turning_direction = 1
  end

  def init_variables_each_turn
    @turn_collector = 0
	@turn_gun_collector = 0
	@turn_radar_collector = 0
  end
  
  def try_to_point_radar_toward_enemy
	unless @current_events['robot_scanned'].empty?
		@ticks_since_last_seen = 0
		@last_reported_distance_to_enemy = @current_events['robot_scanned'][0][0]
		@radar_sweep /= @min_radar_sweep unless @radar_sweep < @min_radar_sweep
		@radar_sweep = @min_radar_sweep if @radar_sweep < @min_radar_sweep
		@radar_turning_direction *= -1
	else
		@ticks_since_last_seen += 1
	end
	 
	if @radar_sweep < @max_radar_sweep and @ticks_since_last_seen > 3
		# We've lost 'em, let's widen our search.
		@radar_sweep *= 2
		@radar_turning_direction *= -1
		@radar_sweep = @max_radar_sweep if @radar_sweep < @max_radar_sweep
		@ticks_since_last_seen = 0
	end

	@turn_radar_collector += @radar_sweep * @radar_turning_direction
  end
 
  def turn_gun_without_turning_radar distance_to_turn
	@turn_gun_collector += distance_to_turn
	@turn_radar_collector -= distance_to_turn
  end
  
  def turn_tank_without_turning_gun distance_to_turn
	@turn_collector += distance_to_turn
	@turn_gun_collector -= distance_to_turn
  end
  
  def turn_gun_to_match_radar
    turn_gun_without_turning_radar determine_turn_distance(radar_heading, gun_heading, @max_gun_sweep)
  end
  
  def turn_tank_to_match_radar
    turn_tank_without_turning_gun determine_turn_distance(radar_heading, heading, @max_tank_sweep)
  end
  
  def movement_state_machine
	#stop
	spin_in_circle
  end

  def spin_in_circle turn_rate = 10
	@turn_collector += turn_rate
	@turn_gun_collector -= turn_rate
	accelerate 1
  end
  
  def charge_enemy
	turn_tank_to_match_radar
	accelerate 1  
  end

  def flee_from_enemy
	turn_tank_to_match_radar	
	accelerate -1
  end
  
  def determine_turn_distance (destination, start, maximum = HalfRotation)
    # Yay! Ruby actually implements the modulus operator correctly!
	diff = (destination - start) % FullRotation
	diff -= FullRotation if diff > HalfRotation
	diff = maximum if diff > maximum
	diff = -maximum if diff < -maximum
	return diff
  end
  
  
end
