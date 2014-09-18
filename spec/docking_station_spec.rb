require 'docking_station'

describe DockingStation do
	let(:station) { DockingStation.new(capacity: 200) }

	it 'should be able to set its own capacity when created' do
	expect(station.capacity).to eq(200)
	end
	
end
