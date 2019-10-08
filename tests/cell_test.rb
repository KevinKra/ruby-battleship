require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/ship.rb";
require_relative "../lib/cell.rb";

class CellTest < Minitest::Test
  # setup
  def setup
    @ship = Ship.new("cruiser", 3)
    @cell_1 = Cell.new("b4")
  end
  # it should exist 
  def test_it_should_exist
    assert_instance_of Cell, @cell_1
  end

  # it should create a cell with a coordinate passed in
  def test_it_should_have_coordinates
    assert_equal "B4", @cell_1.coordinate
  end

  # it should not have a ship attribute upon instantiation, should be nil
  def test_it_returns_nil_for_ship_attr_at_instantiation
    assert_nil @cell_1.ship
  end

  # it should return return true by default when empty? is invoked
  def test_it_returns_true_for_ship_empty_method_at_instantiation
    assert_equal true, @cell_1.empty?
  end

  # it should place a ship when .place_ship is invoked
  def test_it_updates_cells_ship_attr_value_with_the_correct_ship_when_place_ship_is_called
    @cell_1.place_ship(@ship)
    assert_equal @ship, @cell_1.ship
  end

  # it should return false when a ship has been placed in the cell
  def test_that_cell_attr_empty_is_false_when_ship_is_placed
    @cell_1.place_ship(@ship)
    assert_equal false, @cell_1.empty
  end

  # it should print a string message if there is already something placed in the cell
  def test_it_returns_a_string_if_cell_is_not_empty
    @cell_1.place_ship(@ship)
    @cell_2 = Cell.new("a4")
    assert_equal true, @cell_2.empty
    @cell_2.place_ship(@ship)
    assert_equal false, @cell_2.empty
    response = "there is already a ship placed in this cell!"
    assert_equal response, @cell_2.place_ship(@ship)
  end

  # it should return false by default when fired_upon is called.

  # 
end