require 'colorize'
require 'tty-box'
require 'tco'
require 'rmagick'
require 'pry'
require_relative '../ROR-T1W8/lib/nav.rb'
require_relative '../ROR-T1W8/lib/story.rb'
require_relative '../ROR-T1W8/lib/anim.rb'

# Create a new UI
nav = Ror::UI.new

# Clear the screen and print welcome message
nav.clear
nav.welcome

# Ask name
name = nav.ask("What is your name?", /\w/)

# Show intro story
nav.new_line
story = Ror::Story.new
puts anim(story.intro)


# MAIN INPUT LOOP
running = 1
while running
  nav.new_line
  # Get command from user
  cmd = nav.get_cmd
  case cmd
    when "~"
      # ruby gem 'pry' invoked for debugging 
      binding.pry
    when "clear", "cls"
      nav.clear
    when "name", "whoami"
      nav.display_name({:player => player})    
    when "up", "north", "u", "n"
      nav.new_line
      story = Ror::Story.new
      puts anim(story.area_north)
    when "down", "south", "d", "s"
      nav.new_line
      story = Ror::Story.new
      puts anim(story.area_south)
    when "left", "west", "l", "w"
      nav.new_line
      story = Ror::Story.new
      puts anim(story.area_west)
      nav.new_line
      puts anim(story.player_dead)
      if story.player_dead
        nav.clear
        nav.welcome
      end
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
      puts anim(story.area_east)
    when "attack"
      nav.new_line
      story = Ror::Story.new
      puts anim(story.ending)
      nav.new_line
    when
      "help", "h", "?"
      nav.help
    when "quit", "exit"
      nav.quit
    else
      nav.not_found
    end
  end