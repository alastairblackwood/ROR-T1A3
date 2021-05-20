Gem::Specification.new do |s|
    s.name = 'ror'
    s.version = '1.0.1'
    s.date = '2018-04-01'
    s.summary = "Raider Of Redoc is an open-source text-based adventure game written in Ruby."
    s.authors = ["Alastair Blackwood"]
    s.email = "alastair.blackwood@icloud.com"
    s.files = ["ror.rb", "lib/main.rb", "lib/hero.rb", "lib/world.rb", "lib/enemy.rb", "lib/ui.rb", "lib/story.rb"]
    s.add_runtime_dependency 'colorize', '~> 0'
    s.executables << 'ror'
    s.homepage = "https://github.com/sourcerer-io/lots"
    s.license = "GPL-3.0"
  end