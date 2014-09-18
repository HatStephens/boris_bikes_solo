require 'garage'

describe Garage do 

	let(:garage) { Garage.new(capacity: 200) }

	it 'should be able to set its own capacity when created' do
		expect(garage.capacity).to eq(200)
	end

	it 'should automatically receive and fix all bikes from the van' do
		van = double :van
		bike = double :bike, is_a?: :true
		# allow(bike).to receive(:broken?).and_return(true)
		allow(van).to receive(:bikes).and_return([bike])
		allow(bike).to receive(:each).and_return(:bike)
		allow(van).to receive(:release).and_return(bike)
		allow(bike).to receive(:fix!).and_return(bike)
		allow(bike).to receive(:broken?)
		expect{garage.fetch_and_fix(van)}.to change{garage.available_bikes}.to eq([bike])
	end
end
