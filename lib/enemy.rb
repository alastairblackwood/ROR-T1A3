#!/usr/bin/env ruby
#
# The Ranger Of Redoc
# Enemy Class

module Ror

  ENEMY_CATALOG = [
    [:name => "EvilImp", :health => 3, :str => 3], 
    [:name => "Dragon", :health => 4, :str => 4],
    [:name => "The Beast", :health => 7, :str => 5],
  ]
    
  PLAYER_DEAD = "PLAYER_DEAD"
    
  class Enemy
    
    attr_accessor :name
    attr_accessor :health
    attr_accessor :str
    attr_accessor :int
      
    def initialize(args = nil)
      # Pick a random enemy
      selected_enemy = ENEMY_CATALOG.sample[0]    
      @name = selected_enemy[:name]
      @health = selected_enemy[:health] + rand(0..3)
      @str = selected_enemy[:str]
      @int = rand(2..3)
    end
     
    # Enemy attacks player
    def attack(args)
    enemy = self
    player = args[:player]
        
    # Does the enemy hit the player?
    # Enemy strength difference vs player.
    # Hit chance 1 to 100.
    str_diff = (enemy.str - player.str) * 2
    hit_chance = rand(1...100) + str_diff
    
    if (hit_chance > 30)
    # Determine value of the attack
      attack_value = rand(1...player.str)
      print enemy.name.light_red + " hits you for " + attack_value.to_s.light_yellow + " damage!\n"
    if attack_value > player.health
      return PLAYER_DEAD
    else
      return attack_value
    end
    else
      print enemy.name.light_red + " misses you!\n"
    end
      return true
    end
        
    
  end
    
end