require 'garage'

describe Garage do 

	let(:garage) { Garage.new(capacity: 200) }

	it 'should be able to set its own capacity when created' do
	expect(garage.capacity).to eq(200)
	end

end
