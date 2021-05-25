require 'tty-box'
require 'tco'
require 'tty-prompt'
require 'pry'
require 'rainbow'
require 'tty-font'

# Rainbow.enabled = true

require_relative '../ROR-T1A3/lib/nav.rb'
require_relative '../ROR-T1A3/lib/story.rb'
require_relative '../ROR-T1A3/lib/anim.rb'
require_relative '../ROR-T1A3/lib/ascii.rb'
# require_relative '../ROR-T1A3/lib/asciimtn.rb'


# Create a new UI
nav = Ror::UI.new

puts mountain
puts monster


# Clear the screen and print welcome message
nav.clear
nav.welcome
# nav.title

# Ask name
name = nav.ask("What is your name?")

# Show intro story
nav.new_line
story = Ror::Story.new
puts anim(story.intro)
# puts story.intro

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
      nav.new_line
      nav.clear
      nav.welcome
      story = Ror::Story.new
      puts anim(story.intro)
    when "right", "east", "r", "e"
      nav.new_line
      monster
      story = Ror::Story.new
      puts anim(story.area_east)
    when "attack"
      nav.new_line
      story = Ror::Story.new
      puts anim(story.ending)
      nav.end
      nav.new_line
      running = nil
    when
      "help", "h", "?"
      nav.help
    when "quit", "exit"
      nav.quit
      running = nil
    else
      nav.not_found
    end
  end