require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/board'

class BoardTest< Minitest::Test
def setup
  @board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
end

#test it exists
def test_it_exists
assert_instance_of Board, @board
end

#test it has the correct number of cells
def test_it_has_the_correct_number_of_cells
  assert_equal 16, @board.cells.length
end

#test it validates coordinates
def test_the_coordinates_are_valid
  assert_equal true, @board.valid_coordinate("A1")
  assert_equal false, @board.valid_coordinate("ZZ")
end

#test if placement is valid
def test_the_placement_is_valid
  assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
  @board.cells["A2"].empty = false
  assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
end

#test the output of sequential array (does not handle skipped numbers)
def test_if_same_letter_and_sequential_numbers
  assert_equal false, @board.check_if_sequential(["A2", "A1"])
  assert_equal true, @board.check_if_sequential(["A1", "A2", "A3"])
  assert_equal false, @board.check_if_sequential(["A4", "A3", "A1"])
end

#test if different letters and same number (does not handle skipped letters)
  def test_if_different_letters_and_same_number
    assert_equal false, @board.check_if_sequential(["D1", "B2", "C2"])
    assert_equal false, @board.check_if_sequential(["D1", "B2"])
    assert_equal true, @board.check_if_sequential(["A1", "B1", "C1"])
  end

# def test_letters_are_not_skipped
#   assert_equal "false", @board.check_if_sequential(["A1", "C1"])
#   assert_equal "true", @board.check_if_sequential(["A1", "B1"])
# end
#
# def test_numbers_are_not_skipped
#   assert_equal "false", @board.check_if_sequential(["A1", "A2", "A4"])
#   assert_equal "true", @board.check_if_sequential(["A1", "A2", "A3"])
# end
end
