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
		bike = double :bike, is_a?: :true
		expect{station.dock(bike)}.to change{station.bike_count}.by(1)
	end

	it 'should raise an error if person tries to dock another object' do
		object = double :object
		expect{station.dock(object)}.to raise_error(RuntimeError)
	end

	it 'should raise an error if person tries to dock nothing' do
		expect{station.dock()}.to raise_error(RuntimeError)
	end

	it 'should be able to release bikes' do
		bike = double :bike, is_a?: :true
		allow(bike).to receive(:dock)
		station.dock(bike)

		expect{station.release(bike)}.to change{station.bike_count}.by(-1)
	end

end