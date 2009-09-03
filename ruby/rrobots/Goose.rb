require 'robot'

class Goose
  include Robot 

  attr_accessor :last_hit, :hit_me, :i_see_you

#  def initialize
#    super
#    @fire_min, @fire_max = 0, 3
#    @turn_min, @turn_max = -10, 10
#    @turn_gun_min, @turn_gun_max = -30, 30
#    @turn_radar_min, @turn_radar_max = -60, 60
#    @accelerate_min, @accelerate_max = -1, 1
#    @teleport_min, @teleport_max = 0, 100
#    @say_max = 256
#    @broadcast_max = 16
#  end

  def tick events
    unless events['got_hit'].empty?
      hit_me = events['got_hit']
      say "whodat? #{hit_me.inspect}" unless events['got_hit'].empty?
	  if @last_hit && time - @last_hit < 20
        stop	
        turn(rand*10>5 ? -1*rand*10+5 : 1*rand*10+5)
	    accelerate -1 
	    accelerate -1 
	  end
    end 

	accelerate 1 
    fire 1
    detect_edges
  end

  def detect_edges
#    if x >= 1215 || x <= 65 || y >= 895 || y <= 100 640x480
    if x >= (@battlefield_width-80) && ( gun_heading < 45 && gun_heading > 0 )
		if 45-gun_heading < gun_heading
			rotate_turret = 5 + 45-gun_heading
		else
			rotate_turret = 30
		end
        puts "45-#{gun_heading} = #{45-gun_heading} rotate_turret #{rotate_turret}"
      turn_gun rotate_turret
    end

#      135 90 45
#        \ | /
#   180 -  ·  - 0
#        / | \
#	  225 270 315

#    if x >= 1215 || x <= 65 || y >= 895 || y <= 100 640x480

#                   (battlefield_width/2)
#                    (100) x  |
#                         y+-+-+
#                     (65) |\|/|
#   (battlefield_height/2)-|-+-|(battlefield_width-80)
#                          |/|\|
#                          +-+-+
#                   (battlefield_height-80)
	  if x >= (battlefield_width-80) || x <= 65 || y >= (battlefield_height-80) || y <= 100
	    turn( x >= (battlefield_width/2) && (heading > 270 || heading < 315) ? 4*rand*10 : -1*rand*10 )
	  end
      accelerate 1

  end

  def findem
    turn_radar(59)
  end
end
