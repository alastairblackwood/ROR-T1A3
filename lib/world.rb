module Ror
    
  class World
      
    # Return map data in a display format
    def clear
      case col
      when MAP_KEY_SOUTH
        tmp_row << col.colorize(:color => :light_green, :background => :green)
      when MAP_KEY_WEST
        tmp_row << col.colorize(:color => :white, :background => :blue)
      when MAP_KEY_NORTH
        tmp_row << col.colorize(:color => :yellow, :background => :green)
      when MAP_KEY_EAST
        tmp_row << col.colorize(:color => :red, :background => :green)
      end
    end
        
    # Check the current area on the map and describe it
    def check_area(args)
      player = args[:player]
      ui = args[:ui]
      story = args[:story]
    case current_area
    when MAP_KEY_SOUTH
      ui.draw_frame({:text => story.area_south})
    when MAP_KEY_WEST
      ui.draw_frame({:text => story.area_west})
    when MAP_KEY_NORTH
      ui.draw_frame({:text => story.area_north})
    when MAP_KEY_EAST
      ui.draw_frame({:text => story.area_enemy})
      return false
    end
    return true
  end
end

end