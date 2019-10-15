require "./board.rb"
require "./cell.rb"
require "./ship.rb"
require 'pry'

board = Board.new()
submarine = Ship.new("Submarine", 2)

cruiser = Ship.new("Cruiser", 3)
# board.place(cruiser, ["A1", "A2", "A3"])



binding.pry