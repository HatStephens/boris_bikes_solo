require 'bike_container'


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
		station.dock(bike)

		expect{station.release(bike)}.to change{station.bike_count}.by(-1)
	end

	it 'should know which bikes are available' do
		bike = double :bike, is_a?: :true
		station.dock(bike)
		allow(bike).to receive(:broken?).and_return(true)

		expect(station.available_bikes.count).to eq(0) 
	end

	it 'should know which bikes are broken' do
		bike = double :bike, is_a?: :true
		station.dock(bike)
		allow(bike).to receive(:broken?).and_return(true)

		expect(station.broken_bikes.count).to eq(1)
	end

	it 'should be able to receive a capacity' do
		expect{station.capacity=(100)}.to change{station.capacity}.to eq(100)
	end

	it 'should have a default capacity' do
		expect(station.capacity).to eq(10)
	end

	it 'should know that it is full' do
		bike = double :bike, is_a?: :true
		10.times{station.dock(bike)}
		expect(station.full?).to eq(true)
	end

	it 'should not allow docking if it is full' do	
		bike = double :bike, is_a?: :true
		10.times{station.dock(bike)}
		expect{station.dock(bike)}.to raise_error(RuntimeError)	
	end

end