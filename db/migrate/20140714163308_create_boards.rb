class CreateBoards < ActiveRecord::Migration
  def change
  	create_table :boards do |t|
  		t.string :board
  		t.string :solution
  	end
  end
end
