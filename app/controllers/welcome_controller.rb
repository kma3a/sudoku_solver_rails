class WelcomeController < ApplicationController

	def index
		@sudoku = Board.new('000000000000000000000000000000000000000000000000000')
	end

end