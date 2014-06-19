require 'rails_helper'

RSpec.describe Cell, :type => :model do
  let(:cell) {Cell.new(value: 1)}
  let(:cell2) {Cell.new(value: [1,2,3,4,5,6,7,8,9])}

  context '#initialize' do
  	it 'should be an instance of cell' do
  		expect(cell).to be_an_instance_of(Cell)
  	end
  end
end
