class Board

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :board, :previous_board

  def initialize(board)
  	@board = board.split("")
  	@previous_board = []
  end

  def find_row(index)
  	row = (index / 9) + 1
  end

  def find_col(index)
  	col = (index % 9) + 1
  end

  def find_box(index)
  	grid = [1,1,1,2,2,2,3,3,3,
  					1,1,1,2,2,2,3,3,3,
  				  1,1,1,2,2,2,3,3,3,
  					4,4,4,5,5,5,6,6,6,
  					4,4,4,5,5,5,6,6,6,
  					4,4,4,5,5,5,6,6,6,
  					7,7,7,8,8,8,9,9,9,
  					7,7,7,8,8,8,9,9,9,
  					7,7,7,8,8,8,9,9,9]
  	grid[index]
  end
end
