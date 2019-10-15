require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/cell"
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
    assert_equal 16, @board.generate_game.length
  end

  #test it validates coordinates
  def test_the_coordinates_are_valid
    @board.generate_game

    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("ZZ")
  end

  #test if placement is valid
  def test_the_placement_is_valid
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "B1", "C1"])
  end

  #test the output of split arrays
  def test_if_output_splits_elements_into_strings
    assert_equal [["A", "A"], ["1", "2"]], @board.parse_coordinates(["A1", "A2"])
  end

  def test_if_different_letters_and_same_number
     assert_equal true, @board.verify_placement_format([["A", "A"],["1", "2"]])
     assert_equal false, @board.verify_placement_format([["D", "B"],["1","2"]])
     assert_equal true, @board.verify_placement_format([["A", "B", "C"], ["1", "1", "1"]])
  end

  def test_letters_are_not_skipped
    assert_equal false, @board.verify_placement_format([["A", "C"],["1", "1"]])
    assert_equal true, @board.verify_placement_format([["A", "B", "C"], ["1", "1", "1"]])
  end

  def test_numbers_are_sequential_and_not_skipped
    assert_equal false, @board.verify_placement_format([["A", "A", "A"],["1", "2", "4"]])
    assert_equal true, @board.verify_placement_format([["A", "A", "A"],["1", "2", "3"]])
    assert_equal true, @board.verify_placement_format([["A", "A", "A"],["1", "2", "3"]])
    assert_equal false, @board.verify_placement_format([["A", "A", "A"], ["4", "3", "1"]])
    assert_equal false, @board.verify_placement_format([["A", "A", "A"], ["1","2","4"]])
  end

  def test_it_places_ship_on_board

  @board.generate_game
  
     cell_1 = @board.cells["A1"]
     cell_2 = @board.cells["A2"]
     cell_3 = @board.cells["A3"]

    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.cells["A1"].empty?
    assert_equal false, @board.cells["A2"].empty?
    assert_equal false, @board.cells["A3"].empty?
    assert_equal true, @board.cells["A4"].empty?
  end
  #
  # def test_render
  #
  # end
end
