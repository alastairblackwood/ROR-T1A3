require 'tty-box'
require 'tty-prompt'
module Ror

  UI_FRAME_HORIZONTAL = "\u2501"
  UI_FRAME_VERTICAL = "\u2503"
  UI_FRAME_UPPER_LEFT = "\u250F"
  UI_FRAME_LOWER_LEFT = "\u2517"
  UI_FRAME_UPPER_RIGHT = "\u2513"
  UI_FRAME_LOWER_RIGHT = "\u251B"
    
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
        print UI_ARROW.light_yellow + " " + "begin, start, ".light_white + " - Start game"
      new_line(2)
        print UI_ARROW.light_yellow + " " + "east, e, right, ".light_white + "or " + "r".light_white + " - Move east (right)"
      new_line
        print UI_ARROW.light_yellow + " " + "south, s, down, ".light_white + "or " + "d".light_white + " - Move south (down)"
      new_line
        print UI_ARROW.light_yellow + " " + "west, w, left, ".light_white + "or " + "l".light_white + " - Move west (left)"
      new_line
        print UI_ARROW.light_yellow + " " + "north, n, up, ".light_white + "or " + "u".light_white + " - Move north (up)"
      new_line
        print UI_ARROW.light_yellow + " " + "attack".light_white + " - Attack (only in combat)"
      new_line
        print UI_ARROW.light_yellow + " " + "enemy".light_white + " - Display information about your enemy"
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

    # def box_frame(args)
    #   text = args[:text]
    #   text.each do |t|
    #     if t.kind_of?(Array)
    #       t.each do |s|
    #         print TTY::Box.frame()
    #       end
    #     end
    #   end
    # end

    # Draw text surrounded in a nice frame
    def draw_frame(args)
    # Figure out width automatically
      text = args[:text]
      width = get_max_size_from_array(text)
      draw_top_frame(width)
      text.each do |t|
        t_size = get_real_size(t)
        draw_vert_frame_begin
        if t.kind_of?(Array)
          t.each do |s|
            print s
          end
        else
          print t
        end
        (width - (t_size + 4)).times do
          print " " 
        end
        draw_vert_frame_end
        new_line
      end
      draw_bottom_frame(width)
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
    
    def quit
      new_line
        print "You abandoned your journey.".red
      new_line(2)
    end
      
    def get_cmd
      prompt = TTY::Prompt.new
      print "Type ".white + "help".light_white + " for possible commands.\n"
        print "\u2712 ".red + "Your command? ".light_white
      return prompt.select("Commands?", %w(help north south west east attack quit))
    end

    def player_dead(args)
      story = args[:story]
      new_line
      text = story.player_dead
      draw_frame(:text => text)
      new_line
    end

    def player_dead_west(args)
      story = args[:story]
      new_line
      text = story.player_dead_west
      draw_frame(:text => text)
      new_line
    end
    
    private
      
    def draw_vert_frame_begin
      print UI_FRAME_VERTICAL.light_green + " "
    end
    
    def draw_vert_frame_end
      print " " + UI_FRAME_VERTICAL.light_green
    end
      
    def draw_top_frame(width)
      print UI_FRAME_UPPER_LEFT.light_green
      (width - 2).times do
        print UI_FRAME_HORIZONTAL.light_green
    end
      print UI_FRAME_UPPER_RIGHT.light_green
      new_line
    end
    
    def draw_bottom_frame(width)
      print UI_FRAME_LOWER_LEFT.light_green
      (width - 2).times do
        print UI_FRAME_HORIZONTAL.light_green
      end
      print UI_FRAME_LOWER_RIGHT.light_green
      new_line
    end
    
    # Returns actual length of text accounting for UTF-8 and ANSI
    def get_real_size(text)
      if text.kind_of?(Array)
        text.size
      else
        text.uncolorize.size
      end
    end
    
    # Returns size of longest string in array
    def get_max_size_from_array(array)
      max = 0
      array.each do |s|
      s_size = get_real_size(s)
      max = s_size if s_size >= max
      end
      max + 4
    end
    
end
    
end