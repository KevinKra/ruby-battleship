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
    assert_equal 16, @board.cells.length
  end

  #test it validates coordinates
  def test_the_coordinates_are_valid
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("ZZ")
  end

  #test if placement is valid
  def test_the_placement_is_valid
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A2"].empty = false
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
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
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    assert_equal false, @board.cells["A1"].empty?
    assert_equal false, @board.cells["A2"].empty?
    assert_equal false, @board.cells["A3"].empty?
    assert_equal true, @board.cells["A4"].empty?
  end

  def test_it_does_not_display_ship_locations_on_render_false
    false_board = "   1 2 3 4 \n A . . . . \n B . . . . \n C . . . . \n D . . . . \n"
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    assert_equal false_board, @board.render
  end

  def test_it_does_display_ship_locations_on_render_true
    true_board = "   1 2 3 4 \n A S S S . \n B . . . . \n C . . . . \n D . . . . \n"
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    assert_equal true_board, @board.render(true)
  end

  def test_it_displays_correct_board_interactions
    false_board = "   1 2 3 4 \n A H . . . \n B M . . . \n C . . . . \n D . . . . \n"
    true_board = "   1 2 3 4 \n A H S S . \n B M . . . \n C S . . . \n D S . . . \n"
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    @board.place(@submarine, ["C1", "D1"]) 
    @board.cells["A1"].fire_upon
    @board.cells["B1"].fire_upon
    assert_equal true_board, @board.render(true)
    assert_equal false_board, @board.render(false)
  end
end
