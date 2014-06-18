require 'rails_helper'

RSpec.describe Board, :type => :model do
  it 'should take parameters' do
  	expect{Board.new}.to raise_error(ArgumentError)
  end
end
