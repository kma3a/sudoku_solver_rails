class WelcomeController < ApplicationController

	def index
	
	end

	def create
		# board_params
		@board = Board.new(board_params).play!
	end

	private

	def board_params
		p params.require(:array).join
	end

end