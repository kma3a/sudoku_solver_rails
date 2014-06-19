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
    row = (find_row(index) - 1) /3
    col = (find_col(index) - 1) /3
    box = (row * 3) + col + 1 
  end
end
