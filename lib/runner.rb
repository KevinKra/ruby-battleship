require "./board.rb"
require "./cell.rb"
require "./ship.rb"
require 'pry'

board = Board.new()
submarine = Ship.new("Submarine", 2)

binding.pry