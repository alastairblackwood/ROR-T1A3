require_relative '../ROR-T1A3/lib/story.rb'

describe 'Ror' do
    it 'should run through story array in sequential order and print them off until it gets to the end' do
        expect(Ror).to all(be_a(String))
    end
end
        # expect(array_to_test[1]).to all(be_a(String))
        # {STORY_INTRO:"You have travelled many months across the trecherous Land of Redoc... ",
        # "",
        # "You have fought and defeated many monsters and escaped traps and dangers that sought to destroy you. ", 
        # "",
        # "You are weary and have lost much. ",
        # "",
        # "But you cannot turn back now! ".light_red,
        # "",
        # "The final stage of your journey is upon you at last. You enter the Forbidden Forest Of Ybur. ",
        # "",
        # "The foul beast that has beseiged Redoc is awaiting you. You MUST defeat it! ".light_red,
        # "", 
        # "Failure will spell doom for the land and people in it! ", 
        # "",
        # "You are their last hope.",
        # "",value: true},
        # {STORY_AREA_SOUTH:"You enter a clearing in the forest. The starlight spills through the canopy 
        # of trees above you, but the air is eerily still. ",
        # "", 
        # "You feel you are being watched! ".light_red,
        # "",
        # "A small fountain of water is trickling 
        # from a rock in the center of the clearing. You are thirsty..",value: true},
        # {STORY_AREA_WEST:"You make your way through the trees and undergrowth. But the light from 
        # the stars has all but been extinguished down this path 
        # and you cannot see where you are going. Suddenly you step into an empty 
        # void and find yourself plummenting down into a deep ravine. 
        # You hit the bottom... ", 
        # "",
        # "You are dead!".light_red,
        # "",value: true},
        # {STORY_AREA_NORTH:"You make your way North - leaving the Forest Of Ybur. 
        # The snow-capped mountain-range of your homeland can be seen in 
        # the distance. But you cannot return there yet. You must destroy 
        # the monster that has brought so much evil and desruction to the land. 
        # You must go South back into the Forest...",value: true},
        # {STORY_AREA_EAST:"THE BEAST IS UPON YOU!!!!!! ".light_red,
        # "", 
        # "The monstrous creature - wreathed in flames -
        # has malice in his eyes and hurtles towards you - trying to strike a fatal blow... ".light_yellow,
        # "",
        # "You must attack!!".light_green,value: true},
        # {STORY_PLAYER_DEAD:"You have died!".red,
        # "",
        # "You failed to complete your quest. Redoc has fallen into darkness. 
        # Please try again.",value: true},
        # {STORY_ENDING:"You plunge your sword deep into the heart of the beast. 
        # It gives a terrible roar before it crashes to the ground and dies. ".white,
        # "",
        # "You have defeated the monster! ".green,
        # "",
        # "The evil that has plagued The Land Of Redoc for so long has been removed. 
        # The healing of Redoc and it's people can begin. ",
        # "",
        # "As for you - Ranger. You seek only peace and quiet. 
        # You travail the long journey home - to the mountains and great river 
        # that runs through them... ",
        # "",
        # "But you will always be ready... for when Redoc needs you again... ".yellow,
        # "",
        # "THANK YOU FOR PLAYING!".green,value: true}
        # "",
        # ]
        # expect(array_to_test[0]).to all(be_a(String))
        # expect(array_to_test[1]).to all(be_a(String))
#     end
# end