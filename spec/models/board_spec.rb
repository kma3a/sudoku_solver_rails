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

	context '#get_box' do
		it 'should return an array of all the values in the box' do
			board.create_board
			expect(board.get_box(0)).to eq([1,5,9,2])
		end
	end

	context '#get_all_values' do
		it 'should give the values of box, col, and row as one array' do
			board.create_board
			expect(board.get_all_values(0)).to eq([1,5,8,2,7,4,6,9])
		end
	end

	context '#cell_changes' do
		it 'should take the total array and send it to cell to change the cell values' do
			board.create_board
			expect(board.cell_changes(board.game_board[1], 1)).to eq([4,7])
		end
	end

	context '#print_board' do
		it 'should give back the board as an array' do
			board.create_board
			expect(board.print_board).to eq([1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], 6, 7, 6, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 6, 1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 6, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]])
		end
	end

	context '#exterminate' do
		it 'should go through each spot in the array and send it to play' do
			board.create_board
			board.exterminate
			expect(board.print_board).to eq([1, [4, 7], 5, 8, [3, 9], 2, [6, 7], [6, 7], [3, 7], [3, 8], 9, [3, 8], 1, 7, 6, 4, 2, 5, 2, 7, [3, 6], 4, [3, 5], 5, 8, 1, 9, [5, 8], 1, 9, [2, 5], [4, 5], 7, 3, [4, 8], 6, 7, 6, 2, 5, 8, 3, 1, 9, 4, [3, 8], [4, 8], [3, 4, 8], [2, 9], 6, 1, [2, 7], 5, [2, 7, 8], [5, 8, 9], [2, 5, 8], 7, 6, [1, 4, 5, 9], [4, 9], 2, 3, 8, 4, 3, 8, [7, 9], 2, 9, 5, [6, 7], 1, 6, [2, 5], 1, 3, [4, 5], 8, 9, [4, 7], 7])
		end
	end

	context '#is_solved?' do
		it 'should check if the board is solved' do
			board.create_board
			board.exterminate
			expect(board.is_solved?).to eq(false)
		end
	end

	context '#inconceivable' do
		it 'should return false if it is not impossible' do
			board.create_board
			board.exterminate
			expect(board.inconceivable).to eq(false)
		end

		it 'should return true if it is impossible' do
			board_2.create_board
			board_2.exterminate
			expect(board_2.inconceivable).to eq(true)
		end
	end

	context '#need_guess' do
		it 'should return true if prevous board is the same as the current board' do
			board.create_board
			board.exterminate
			board.need_guess
			expect(board.need_guess).to eq(true)
		end

		it 'should return true if prevous board is the same as the current board' do
			board.create_board
			board.exterminate
			expect(board.need_guess).to_not eq(true)
		end
	end

	context '#play' do
		it 'should keep the game going until solved' do
			board.play
			expect(board.print_board).to eq([1, 4, 5, 8, 9, 2, 6, 7, 3, 8, 9, 3, 1, 7, 6, 4, 2, 5, 2, 7, 6, 4, 3, 5, 8, 1, 9, 5, 1, 9, 2, 4, 7, 3, 8, 6, 7, 6, 2, 5, 8, 3, 1, 9, 4, 3, 8, 4, 9, 6, 1, 7, 5, 2, 9, 5, 7, 6, 1, 4, 2, 3, 8, 4, 3, 8, 7, 2, 9, 5, 6, 1, 6, 2, 1, 3, 5, 8, 9, 4, 7])
		end
	end

	context '#get_cell_value' do
		it 'should get the value of the cell' do
			board.create_board
			expect(board.get_cell_value(board.game_board[0])).to eq(1)
		end
	end
end
