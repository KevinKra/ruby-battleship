require "./board.rb"
require "./cell.rb"
require "./ship.rb"
require 'pry'

board = Board.new()
submarine = Ship.new("Submarine", 2)

# a = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".",]
# b = "  1 2 3 4 \n "
# c = ""
# arr = ["B", "C", "D"]
# a.each_with_index do |element, i|
#   c.concat(" #{element}")
#   if (i + 1) % 4 == 0
#     c.concat("\n")
#   end
#   if (i == 3 || i == 7 || i == 11)
#     c.concat(" #{arr.slice!(0)}")
#   end
# end

# d = b + "A" + c

cruiser = Ship.new("Cruiser", 3)
board.place(cruiser, ["A1", "A2", "A3"])
board.render


binding.pry