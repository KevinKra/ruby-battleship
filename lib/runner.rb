require "./board.rb"
require "./cell.rb"
require "./ship.rb"
require "./play.rb"
require 'pry'

board = Board.new()
submarine = Ship.new("Submarine", 2)
game = Play.new

cruiser = Ship.new("Cruiser", 3)
board.place(cruiser, ["A1", "A2", "A3"])
board.place(submarine, ["C1", "C2"])

game.start_game



binding.pry