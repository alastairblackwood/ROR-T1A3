module Ror

  ENEMY_KILLED = "KILLED"
    
  HIT_CHANCE_MODIFIER = 5
  ATTACK_VALUE_MODIFIER = 1
    
  class Hero
      
  attr_accessor :name
  attr_accessor :health
  attr_accessor :str
  attr_accessor :int
  attr_accessor :in_combat
  attr_accessor :current_enemy
  attr_accessor :dead
    
  def initialize (args)
    name = args[:name]
    world = args[:world]
    @name = name
    @health = 50
    @str = 5
    @int = 5
    @in_combat = false
    @current_enemy = nil
    @dead = 0
    return "Welcome %{name}! Let's play The Ranger Of Redoc!"
  end
    
  # Player attacks enemy
  def attack(args)
    player = self
    enemy = args[:enemy]
    nav = args[:nav]
    
  # Does the player even hit the enemy?
  # Hit chance player/enemy stength discrepency.
    nav.enemy_info({:player => player})
    nav.player_info({:player => player})
    str_diff = (player.str - enemy.str) * 2
    hit_chance = rand(1...100) + str_diff + HIT_CHANCE_MODIFIER
    
  if (hit_chance > 50)
    # Determine value of the attack
    attack_value = rand(1...player.str) + ATTACK_VALUE_MODIFIER
      if attack_value > enemy.health
      print "You swing and " + "hit".light_yellow + " the " + enemy.name.light_red + " for " + attack_value.to_s.light_white + " damage, killing it!\n"
    return ENEMY_KILLED
  else
    print "You swing and " + "hit".light_yellow + " the " + enemy.name.light_red + " for " + attack_value.to_s.light_white + " damage!\n"
    return attack_value
  end
  else
    print "You swing and " + "miss".light_red + " the " + enemy.name + "!\n"
      return 0
  end
  return true
  end
        
  def move(args)
    direction = args[:direction]
    world = args[:world]
    nav = args[:ui]
    story = args[:story]
    case direction
    when :up
      story.area_north
    end
    case direction
    when :down
      story.area_south
    end
    case direction
    when :left
      story.area_west
    end
    case direction
    when :right
      story.area_east
    end
  end
        
      
end
    
end