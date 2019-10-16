require "./board.rb"
require "./cell.rb"
require "./ship.rb"
require "./game.rb"
require_relative "./computer_player.rb"
require 'pry'

computer_board = Board.new
player_board = Board.new
submarine = Ship.new("Submarine", 2)
cruiser = Ship.new("Cruiser", 3)
cruiser2 = Ship.new("Cruiser", 3)
computer_player = ComputerPlayer.new
game = Game.new

# board.place(cruiser, ["A1", "A2", "A3"])
# board.place(submarine, ["C1", "C2"])
# binding.pry
# computer_player.place_ships_on_board([cruiser, submarine], computer_board)


game.init_game


