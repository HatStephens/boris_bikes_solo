require 'bike_container'
require 'bike'

class Station; include BikeContainer end

describe BikeContainer do
	let(:station) {station=Station.new}

	it 'should know what bikes it has' do
		expect(station.bikes).to eq([])
	end

	it 'should be able to count the bikes it has' do
		expect(station.bike_count).to eq(0)
	end

	it 'should be able to receive a bike' do
		bike = double :bike
		allow(bike).to receive(:count)
		expect{station.dock(bike)}.to change{station.bike_count}.by(1)
	end


end