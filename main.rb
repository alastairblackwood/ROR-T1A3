require 'colorize'
require 'tty-box'
require_relative '../ROR-T1W8/lib/nav.rb'
require_relative '../ROR-T1W8/lib/story.rb'
require_relative '../ROR-T1W8/lib/hero.rb'
require_relative '../ROR-T1W8/lib/enemy.rb'

# Create a new UI
nav = Ror::UI.new

# Clear the screen and print welcome message
nav.clear
nav.welcome

# Ask name
name = nav.ask("What is your name?", /\w/)

# Create a new player
player = Ror::Hero.new({:name => name})

# Show intro story
nav.new_line
story = Ror::Story.new
nav.draw_frame({:text => story.intro})


# MAIN INPUT LOOP
running = 1
while running
  nav.new_line
  # Get command from user
  cmd = nav.get_cmd
  case cmd
    when "~"
      binding.pry
    when "clear", "cls"
      nav.clear
    when "name", "whoami"
      nav.display_name({:player => player})    
    when "up", "north", "u", "n"
      nav.new_line
      story = Ror::Story.new
      nav.draw_frame({:text => story.area_north})
    when "down", "south", "d", "s"
      nav.new_line
      story = Ror::Story.new
      nav.draw_frame({:text => story.area_south})
    when "left", "west", "l", "w"
      nav.new_line
      story = Ror::Story.new
      nav.draw_frame({:text => story.area_east})
    when "right", "east", "r", "e"
      nav.new_line
      puts "                                             ,--,  ,.-.
               ,                   \,       '-,-`,'-.' | ._
              /|           \    ,   |\         }  )/  / `-,',
              [ ,          |\  /|   | |        /  \|  |/`  ,`
              | |       ,.`  `,` `, | |  _,...(   (      .',
              \  \  __ ,-` `  ,  , `/ |,'      Y     (   /_L\
               \  \_\,``,   ` , ,  /  |         )         _,/
                \  '  `  ,_ _`_,-,<._.<        /         /
                 ', `>.,`  `  `   ,., |_      |         /
                   \/`  `,   `   ,`  | /__,.-`    _,   `\
               -,-..\  _  \  `  /  ,  / `._) _,-\`       \
                \_,,.) /\    ` /  / ) (-,, ``    ,        |
               ,` )  | \_\       '-`  |  `(               \
              /  /```(   , --, ,' \   |`<`    ,            |
             /  /_,--`\   <\  V /> ,` )<_/)  | \      _____)
       ,-, ,`   `   (_,\ \    |   /) / __/  /   `----`
      (-, \           ) \ ('_.-._)/ /,`    /
      | /  `          `/ \\ V   V, /`     /
   ,--\(        ,     <_/`\\     ||      /
  (   ,``-     \/|         \-A.A-`|     /
 ,>,_ )_,..(    )\          -,,_-`  _--`
(_ \|`   _,/_  /  \_            ,--`
 \( `   <.,../`     `-.._   _,-`"
      story = Ror::Story.new
      nav.draw_frame({:text => story.area_east})
      unless player.in_combat
        if !player.move({:direction => :right, :world => world, :nav => nav, :story => story})
          player.in_combat = 1
	      end
      else
        nav.cannot_travel_combat
      end
    when "attack", "a"
      if player.in_combat
        retval = player.attack({:enemy => player.current_enemy, :nav => nav})
	      if retval == Ror::ENEMY_KILLED
          story = Ror::Story.new
          nav.draw_frame({:text => story.story_end})
          # Take player out of combat
          player.current_enemy = nil
	        player.in_combat = false
	      end
	      if retval.is_a? Numeric
          player.current_enemy.health -= retval
	        retval = player.current_enemy.attack({:player => player})
	        if retval.is_a? Numeric
            player.health -= retval
          end
	      if retval == Ror::PLAYER_DEAD
          player.dead = 1
	      end
	    end
    else
      nav.not_in_combat
    end
    when "player", "me", "info", "status", "i"
      nav.player_info({:player => player})
    when "enemy"
      if player.in_combat
        nav.enemy_info({:player => player})
      else
        nav.not_in_combat
      end
    when "lines", "score"
      nav.lines({:player => player})
    when "suicide"
      player.dead = 1
    when "help", "h", "?"
      nav.help
    when "quit", "exit"
      nav.quit
      running = nil
    else
      nav.not_found
  end
  # Is player in combat but has no enemy? Assign one.
  if player.in_combat && !player.current_enemy
    enemy = Ror::Enemy.new
    player.current_enemy = enemy
    nav.enemy_greet({:enemy => enemy})
  end
  # Player is dead!
  if player.dead == 1
      nav.player_dead({:story => story.PLAYER_DEAD})
    exit
  end
  # If player has reached Sourcerer
  if player == Ror::ENEMY_KILLED
    nav.draw_frame({:text => story.ending})
    nav.new_line
    running = false
  end
end