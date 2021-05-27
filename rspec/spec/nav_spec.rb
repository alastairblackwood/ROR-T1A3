require_relative '../ROR-T1A3/lib/nav.rb'

describe 'ask method' do
    it 'should check the input given to the ask method' do
        # result should be true or false
        result = ask("Is this a question", true, )
        # Expect your input to be true if it passes the filter or expect your input to be false if it does not pass
        expect(result).to be(true) 
    end
end