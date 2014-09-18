require 'bike'

describe Bike do
	
	let(:bike) {Bike.new}

	it 'should be created in an unbroken state' do
		expect(bike.broken?).to be(false)	
	end

	it 'should be able to be broken' do
		expect(bike.break!.broken?).to be(true)
	end

end