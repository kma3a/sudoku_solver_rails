class WelcomeController < ApplicationController

	def index
	
	end

	def create
		@board = Board.new(board_params).play
	end

	private

	def board_params
		p params.require(:/).values.join
	end

end