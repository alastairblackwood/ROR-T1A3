require 'tty-box'
require 'tty-prompt'
require 'tty-font'
require 'pastel'

module Ror
    
  UI_COPYRIGHT = "\u00A9"
  UI_EMAIL = "\u2709"
  UI_ARROW = "\u2712"

  
    
  class UI

    # Clear the screen
    def clear
      print "
      ▀█▀ █░█ █▀▀   █▀█ ▄▀█ █▄░█ █▀▀ █▀▀ █▀█   █▀█ █▀▀   █▀█ █▀▀ █▀▄ █▀█ █▀▀
      ░█░ █▀█ ██▄   █▀▄ █▀█ █░▀█ █▄█ ██▄ █▀▄   █▄█ █▀░   █▀▄ ██▄ █▄▀ █▄█ █▄▄".light_red
    end

    
    # Navigation commands
    def help
      new_line
        print "Valid Commands".light_green
      new_line
        print UI_ARROW.light_yellow + " " + "north, n, up, ".light_white + "or " + "u".light_white + " - Move north (up)"
      new_line
        print UI_ARROW.light_yellow + " " + "south, s, down, ".light_white + "or " + "d".light_white + " - Move south (down)"
      new_line
        print UI_ARROW.light_yellow + " " + "west, w, left, ".light_white + "or " + "l".light_white + " - Move west (left)"
        new_line
        print UI_ARROW.light_yellow + " " + "east, e, right, ".light_white + "or " + "r".light_white + " - Move east (right)"
      new_line(2)
        print UI_ARROW.light_yellow + " " + "attack".light_white + " - Attack (only in combat)"
      new_line
        print UI_ARROW.light_yellow + " " + "clear, cls".light_white + " - Clears the screen"
      new_line
        print UI_ARROW.light_yellow + " " + "quit, exit".light_white + " - Quits the game"
      new_line
    end
    
    # Ask user a question. A regular expression filter can be applied.
    def ask(question, filter = nil)
      if filter
        match = false
        answer = nil
        while match == false
          print UI_ARROW.red + question.light_white + " "
          answer = gets.chomp
            if answer.match(filter)
              return answer
          else
            print "Sorry, please try again.".red
            new_line
            new_line
          end
        end
      else
        print "\u2712 ".red + question.light_white + " "
        return gets.chomp
      end
    end
      
    # Display welcome
    def welcome
      new_line
      new_line
       # TTY Box method
      box = TTY::Box.frame "The Ranger Of Redoc".light_green, "by Alastair Blackwood"
      print box
      new_line
      new_line
    end
    
    # Prints a new line. Optimally can print multiple lines.
    def new_line(times = 1)
      times.times do
        print "\n"
    end

  end
      
    def not_found
      print "Command not understood. Please try again.".red
      new_line
    end
     
    def cannot_travel_combat
      puts "You are in combat and cannot travel!"
    end
    
    def not_in_combat
      puts "You are not in combat."
    end

    def ending
      font = TTY::Font.new(:doom)
      pastel = Pastel.new
      puts pastel.yellow(font.write("THE END"))
    end

    def end
      new_line
      print "
      ▀█▀ █░█ █▀▀   █▀▀ █▄░█ █▀▄
      ░█░ █▀█ ██▄   ██▄ █░▀█ █▄▀".light_yellow
    end
    
    # Quit method
    def quit
      new_line
        print "You abandoned your journey.".red
      new_line(2)
      clear
      new_line
      welcome
      new_line
    end
      
    # TTY prompt method
    def get_cmd
      prompt = TTY::Prompt.new
      print "Type ".white + "help".light_white + " for possible commands.\n"
        print "\u2712 ".red + "Your command? ".light_white
      return prompt.select("Commands?", %w(help north south west east attack quit))
    end
    
end
    
end