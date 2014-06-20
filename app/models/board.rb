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

  def get_cell_value(cell)
    cell.value
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

  def cell_changes(cell, index)
    cell.play(get_all_values(index))
  end

  def get_all_values(index)
    (get_row(index) + get_col(index) + get_box(index)).uniq
  end

  def get_row(index)
    row = find_row(index)
    row_array = []
    game_board.each_with_index { |cell, index| row_array << get_cell_value(cell) if find_row(index) == row && !get_cell_value(cell).is_a?(Array)}
    row_array
  end

  def get_col(index)
    col = find_col(index)
    col_array = []
    game_board.each_with_index { |cell, index| col_array << get_cell_value(cell) if find_col(index) == col && !get_cell_value(cell).is_a?(Array)}
    col_array
  end

  def get_box(index)
    box = find_box(index)
    box_array = []
    game_board.each_with_index { |cell, index| box_array << get_cell_value(cell) if find_box(index) == box && !get_cell_value(cell).is_a?(Array)}
    box_array
  end

  def exterminate
    game_board.each_with_index {|cell,index| cell_changes(cell, index)}
  end

  def print_board
    end_board = game_board.map {|cell| get_cell_value(cell) == [] ? 0 : get_cell_value(cell)}
    end_board
  end

  def is_solved?
    game_board.map{|cell| get_cell_value(cell)}.flatten.length == 81
  end

  def inconceivable
    game_board.map{|cell| get_cell_value(cell)}.include?([])
  end

  def need_guess
    if previous_board == game_board.map{|cell| get_cell_value(cell)}
      return true
    end
    self.previous_board = game_board.map{|cell| get_cell_value(cell)}
  end

  def play
    create_board
    until is_solved?
      exterminate
      if inconceivable
        return "inconceivable"
      end
    end
  end
end
