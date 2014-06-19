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

		it 'should be and array' do
			expect(board.board.is_a?(Array)).to be(true)
		end
	end

	context '#find_row' do
		it 'should find a row with a given index' do
			expect(board.find_row(25)).to eq(3)
		end

		it 'should find the row with a different index' do
			expect(board.find_row(40)).to eq(5)
		end
	end

	context '#previous_board' do
		it 'should be empty' do
			expect(board.previous_board).to eq([])
		end
	end

	context '#find_col' do
		it 'should give the column when given the index' do
			expect(board.find_col(37)).to eq(2)
		end

		it 'should give a different colum with given a different index' do
			expect(board.find_col(78)).to eq(7)
		end
	end

	context '#find_box' do
		it 'should give the box number when given the index' do
			expect(board.find_box(63)).to eq(7)
		end

		it 'should give a diffrerent number when given a different index' do
			expect(board.find_box(40)).to eq(5)
		end
	end

	context '#game_board' do
		it 'should be blank at the start of game' do
			expect(board.game_board).to eq([])
		end
	end

	context '#create_board' do
		it 'should add to game board' do
			board.create_board
			expect(board.game_board.length).to eq(81)
		end
	end

	context '#create_cell' do
		it 'should create instances of cell' do
			board.create_board
			expect(board.game_board[1]).to be_an_instance_of(Cell)
		end
	end

	context '#cell_value' do
		it 'should take a value of 0 and get back an array' do
			expect(board.cell_value("0")).to eq((1..9).to_a)
		end
	end

	context '#get_row' do
		it 'should return an array of all the values already in that row' do
			board.create_board
			expect(board.get_row(0)).to eq([1,5,8,2])
		end
	end

	context '#get_col' do
		it 'should return an array of all the values in the column' do
			board.create_board
			expect(board.get_col(0)).to eq([1,2,7,4,6])
		end
	end

end
