class WelcomeController < ApplicationController

	def index
	
	end

	def create
		@board = Board.new(board_params).play!
		render partial: "sudoku"
	end

	private

	def board_params
		p params.require(:array).join
	end

end