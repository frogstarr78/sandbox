#!/usr/bin/ruby

# The guts of life force within Dwemthy's Array
class Creature

  # Get a metaclass for this class
  def self.metaclass; class << self; self; end; end

  # Advanced metaprogramming code for nice, clean traits
  def self.traits( *arr )
    return @traits if arr.empty?

  # 1. Set up accessors for each variable
    attr_accessor *arr

  # 2. Add a new class method to for each trait.
    arr.each do |a|
      metaclass.instance_eval do
        define_method( a ) do |val|
          @traits ||= {}
          @traits[a] = val
        end
      end
    end

    # 3. For each monster, the `initialize' method
    #    should use the default number for each trait.
    class_eval do
      define_method( :initialize ) do
        self.class.traits.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end
    end

  end

  # Creature attributes are read-only
  traits :life, :strength, :charisma, :weapon

  # This method applies a hit taken during a fight.
  def hit( damage )
    p_up = rand( charisma )
      if p_up % 9 == 7
        @life += p_up / 4
        puts "[#{ self.class } magick powers up #{ p_up }!]"
      end 
    @life -= damage
    puts "[#{ self.class } has died.]" if @life <= 0
  end

  # This method takes one turn in a fight.
  def fight( enemy, weapon )
    if life <= 0
      puts "[#{ self.class } is too dead to fight!]"
      return
    end

    # Attack the opponent
    your_hit = rand( strength + weapon )
    puts "[You hit with #{ your_hit } points of damage!]"
    enemy.hit( your_hit )

    # Retaliation
    p enemy
    if enemy.life > 0
      enemy_hit = rand( enemy.strength + enemy.weapon )
      puts "[Your enemy hit with #{ enemy_hit } points of damage!]"
      self.hit( enemy_hit )
    end
  end

end

class DwemthysArray < Array
  alias _inspect inspect
  def inspect; "#<#{ self.class }#{ _inspect }>"; end
  def method_missing( meth, *args )
    answer = first.send( meth, *args )
    if first.life <= 0
      shift
      if empty?
        puts "[Whoa.  You decimated Dwemthy's Array!]"
      else
        puts "[Get ready. #{ first.class } has emerged.]"
      end
    end
    answer || 0
  end
end

class Rabbit < Creature 
  traits :bombs 
  life 10 
  strength 2 
  charisma 44 
  weapon 4 
  bombs 3 

  # little boomerang 
  def ^( enemy )
    fight( enemy, 13 )
  end 

  # the hero's sword is unlimited!! 
  def /( enemy )
    fight( enemy, rand( 4 + ( ( enemy.life % 10 ) ** 2 ) ) )
  end 

  # lettuce will build your strength and extra ruffage 
  # will fly in the face of your opponent!! 
  def %( enemy )
    lettuce = rand( charisma ) 
    puts "[Healthy lettuce gives you #{ lettuce } life points!!]"
    @life += lettuce
    fight( enemy, 0 )
  end 

  # bombs, but you only have three!! 
  def *( enemy )
    if @bombs.zero?
      puts "[UHN!! You're out of bombs!!]"
      return
    end
    @bombs -= 1
    fight( enemy, 86 )
  end 
end

class ScubaArgentine < Creature
  life 46
  strength 35
  charisma 91
  weapon 2
end
class IndustrialRaverMonkey < Creature
  life 46
  strength 35
  charisma 91
  weapon 2
end
class DwarvenAngel < Creature
  life 540
  strength 6
  charisma 144
  weapon 50
end
class AssistantViceTentacleAndOmbudsman < Creature
  life 320
  strength 6
  charisma 144
  weapon 50
end
class TeethDeer < Creature
  life 655
  strength 192
  charisma 19
  weapon 109
end
class IntrepidDecomposedCyclist < Creature
  life 901
  strength 560
  charisma 422
  weapon 105
end
class Dragon < Creature
  life 1340 # tough scales
  strength 451 # bristling veins
  charisma 1020 # toothy smile
  weapon 939 # fire breath
end

dwarr = DwemthysArray[
  IndustrialRaverMonkey.new,
  DwarvenAngel.new,
  AssistantViceTentacleAndOmbudsman.new,
  TeethDeer.new,
  IntrepidDecomposedCyclist.new,
  Dragon.new
]
r = Rabbit.new
s = ScubaArgentine.new
