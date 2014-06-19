class Board

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :board, :previous_board, :game_board

  def initialize(board)
  	@board = board.split("")
  	@previous_board = []
    @game_board = []
  end

  def create_board
    self.game_board = board.map do |cell|
      create_cell(cell)
    end
  end

  def create_cell(input_value)
    Cell.new(value: cell_value(input_value))
  end

  def cell_value(value)
    value == "0" ? (1..9).to_a : value.to_i
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
