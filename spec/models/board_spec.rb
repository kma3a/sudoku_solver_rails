require 'rails_helper'

RSpec.describe Board, :type => :model do
	let(:board) {Board.new("105802000090076405200400819019007306762083090000061050007600030430020501600308900")}
	let(:board_2) {Board.new("182345740050008019010000000800005000000804000000300006000000070030500080972400050")}
	let(:board_3) {Board.new("000689100800000029150000008403000050200005000090240801084700910500000060060410000")}

  context '#initialize' do
	  it 'should take parameters' do
	  	expect{Board.new}.to raise_error(ArgumentError)
	  end

	  it 'should be an instance of board' do
	  	expect(board).to be_an_instance_of(Board)
	  end
	end

	context '#board' do
		it 'should ecpect board to have a length of 81' do
			expect(board.board.length).to eq(81)
		end
	end 

end
