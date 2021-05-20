module Ror

STORY_INTRO = [
  "You have travelled many months across the trecherous" + " " + "Land of Redoc".light_white + ". 
  You have fought and defeated many monsters and escaped traps 
  and dangers that sought to destroy you. You are weary and have lost much.
  But you cannot turn back now!".light_white + ". The final stage of your 
  journey is finally upon you. You enter the Forbidden Forest Of Ybur.",
  "",
  "The foul beast that has beseiged Redoc is awaiting you. You MUST defeat it! 
  Failure will spell doom for the land and people 
  in it. You are their last hope.",
  "",
]
    
STORY_AREA_SOUTH = [
  "You enter a clearing in the forest. The starlight spills through the canopy 
  of trees above you, but the air is eerily still. 
  You feel you are being watched. A small fountain of water is trickling 
  from a rock in the center of the clearing. You are thirsty.. "
]
    
STORY_AREA_WEST = [
  "You make your way through the trees and undergrowth. But the light from 
  the stars has all but been extinguished down this path 
  and you cannot see where you are going. Suddenly you step into an empty 
  void and find yourself plummenting down into a deep ravine. 
  You hit the bottom...You are dead."
]
    
STORY_AREA_NORTH = [
  "You make your way North and emerge out of the Forest Of Ybur. 
  The snow-capped mountain-range of your homeland can be seen in 
  the distance. But you cannot return there yet. You must destroy 
  the monster that has brought so much evil and desruction to the land. 
  You must go South back into the Forest..."
]
    
STORY_AREA_EAST = [
  "THE BEAST IS UPON YOU!!!!!! The monstrous creature
  has malice in his eyes and lunges towards you - trying to strike
  a fatal blow...".light_red
]
    
STORY_PLAYER_DEAD = [
  "You have died!".light_red,
  "",
  "You failed to complete your quest. Redoc has fallen into darkness. 
  Please try again.",
]
    
STORY_END = [
  "You plunge your sword deep into the heart of the beast. 
  It gives a terrible roar before it crashes to the ground and dies. 
  You have defeated the monster!".light_white,
  "",
  "The evil that has plagued The Land Of Redoc for so long has been removed. 
  The healing of Redoc and it's people can begin",
  "",
  "As for you - Ranger. You seek only peace and quiet. 
  You travail the long journey home - to the mountains and great river 
  that runs through them...",
  "",
  "But you will always be ready... for when the world needs you again".light_yellow,
  "",
  "THANK YOU FOR PLAYING!".light_green,
  "",
]
    
class Story
    
  def intro
    return STORY_INTRO
  end
    
  def ending
    return STORY_END
  end
    
  def area_south
    return STORY_AREA_SOUTH
  end
        
  def area_west
    return STORY_AREA_WEST
  end
        
  def area_north
    return STORY_AREA_NORTH
  end
    
  def area_east
    return STORY_AREA_EAST
  end
    
  def player_dead
    return STORY_PLAYER_DEAD
  end

  # This method will iterate over each line individually from the .txt # file and print it to the console
  def render_ascii_art
    File.readlines("filename.txt") do |line|
    puts line
  end
end 
        
end
    
end