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

  #test the output of split arrays
  def test_if_output_splits_elements_into_strings
    assert_equal [["A", "A"], ["1", "2"]], @board.create_output(["A1", "A2"])
  end

  def test_if_different_letters_and_same_number
     assert_equal true, @board.check_if_sequential(["A1", "A2"])
     assert_equal false, @board.check_if_sequential(["D1", "B2"])
     assert_equal true, @board.check_if_sequential(["A1", "B1", "C1"])
  end

  def test_letters_are_not_skipped
    assert_equal false, @board.check_if_sequential(["A1", "C1"])
    assert_equal true, @board.check_if_sequential(["A1", "B1", "C1"])
  end

  def test_numbers_are_sequential_and_not_skipped
    assert_equal false, @board.check_if_sequential(["A1", "A2", "A4"])
    assert_equal true, @board.check_if_sequential(["A1", "A2", "A3"])
    assert_equal true, @board.check_if_sequential(["A1", "A2", "A3"])
    assert_equal false, @board.check_if_sequential(["A4", "A3", "A1"])
    assert_equal false, @board.check_if_sequential(["A1", "A2", "A4"])
  end
  # 
  # def test_coordinates_are_on_board
  #   assert_equal false, @board.valid_placement?(@cruiser, (["A3", "A4", "A5"]))
  # end
end
