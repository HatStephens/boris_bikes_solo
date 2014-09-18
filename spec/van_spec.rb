require 'van'
require 'bike'
require 'docking_station'

describe Van do
	let(:van) {Van.new(capacity: 200)}

	it 'should be able to dock all broken bikes from dock' do
		station = double :station, release: nil
		bike = double :bike, is_a?: :true
		allow(station).to receive(:broken_bikes).and_return([bike])
		allow(bike).to receive(:each).and_return(:bike)

		expect{van.collect_broken_bikes(station)}.to change{van.bike_count}.by(1)
	end

	it 'should be able to dock all fixed bikes from garage' do
		garage = double :station, release: nil
		bike = double :bike, is_a?: :true
		allow(garage).to receive(:bikes).and_return([bike])
		allow(bike).to receive(:each).and_return(:bike)

		expect{van.collect_fixed_bikes(garage)}.to change{van.bike_count}.by(1)
	end

	it 'should be able to set its own capacity when created' do
		expect(van.capacity).to eq(200)
	end

end