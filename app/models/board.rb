class Board

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :board, :previous_board

  def initialize(board)
  	@board = board.split("")
  	@previous_board = []
  end
end
