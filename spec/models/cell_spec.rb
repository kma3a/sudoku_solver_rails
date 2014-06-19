require 'rails_helper'

RSpec.describe Cell, :type => :model do
  let(:cell) {Cell.new(value: 1)}
  let(:cell2) {Cell.new(value: [1,2,3,4,5,6,7,8,9])}

  context '#initialize' do
  	it 'should be an instance of cell' do
  		expect(cell).to be_an_instance_of(Cell)
  	end

  	it 'should give error if no value' do
  		expect{Cell.new}.to raise_error(ArgumentError)
  	end
  end

  context '#change_value' do
  	it 'should change the value in the value' do
  		cell2.change_value([1,2,5,7])
  		expect(cell2.value).to eq([3,4,6,8,9])
  	end

  	it 'should not change the vale if it is not an array' do
  		cell.change_value([2,3,4,5,3])
  		expect(cell.value).to eq(1)
  	end
  end

  context '#check_value' do
  	it 'should check if the value is an array of one' do
  		cell2.change_value([2,3,4,5,6,7,8,9])
  		expect(cell2.check_value).to eq(true)
  	end

  	it 'should return false if it does not meet qualifications' do
  		expect(cell.check_value).to eq(false)
  	end
  end

  context '#make_value' do
  	it 'should make the value a number if check_value is true' do
  		cell2.change_value([2,3,4,5,6,7,8,9])
  		expect(cell2.make_value).to eq(1)
  	end

  	it 'should be the same if check_value is false' do
  		expect(cell.make_value).to eq(1)
  	end
  end

  context '#play' do
  	it 'should make it go through the rest of the methods' do
  		expect(cell2.play([1,2,4,5,6,7,8,9])).to eq(3)
  	end

  	it 'should go through and leave it if array is still full' do
  		expect(cell2.play([1,2,4,5,6,7,9])).to eq([3,8])
  	end

  	it 'should leave it alone if the value is not an array' do
  		expect(cell.play([1,2,4,5,6,7,9])).to eq(1)
  	end
  end
end
