require 'asciiart'

class AsciiArt

    def mountain
        mountain = AsciiArt.new("/ascii/ascii_mountain.txt")
        puts mountain(width: 30)
    end

end