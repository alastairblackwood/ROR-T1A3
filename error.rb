require_relative '../ROR-T1A3/lib/nav.rb'

begin
    get_cmd["prompt"]
  rescue NameError => e
    puts e
  end
end