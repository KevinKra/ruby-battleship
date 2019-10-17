require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/ship.rb";
require_relative "../lib/cell.rb";

class CellTest < Minitest::Test
  # setup
  def setup
    @ship = Ship.new("cruiser", 2)
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
    response = "There is already a ship placed in this cell!"
    assert_equal response, @cell_2.place_ship(@ship)
  end

  # it should return false by default when fired_upon is called.
  def test_it_returns_false_when_fired_upon_is_invoked
    assert_equal false, @cell_1.fired_upon
  end

  # it should reduce the health of the ship in the cell when .fire_upon is called
  def test_it_reduces_health_of_ship_in_cell_when_fired_upon
    assert_equal @ship.health, @ship.length
    @cell_1.place_ship(@ship)
    @cell_1.fire_upon
    assert_equal @ship.health, @ship.length - 1
  end

  def test_it_returns_a_string_if_cell_is_empty_and_is_fired_upon
    response = "Your shot on B4 was a miss."
    assert_equal response, @cell_1.fire_upon
    assert_equal @ship.health, @ship.length
    assert_equal true, @cell_1.fired_upon
  end

  def test_it_returns_a_string_if_cell_has_already_been_fired_upon
    response = "Your shot on B4 was a miss."
    response_2 = "You've already targeted this coordinate!"
    # test misses on cell
     assert_equal response, @cell_1.fire_upon
    assert_equal response_2, @cell_1.fire_upon
    assert_equal @ship.health, @ship.length
    # test hits on cell
    @cell_2 = Cell.new("a4")
    @cell_2.place_ship(@ship)
    @cell_2.fire_upon
    assert_equal @ship.health, @ship.length - 1
    assert_equal response_2, @cell_2.fire_upon
    assert_equal @ship.health, @ship.length - 1
  end

  def test_it_returns_period_when_render_method_is_initially_called
    assert_equal ".", @cell_1.render
  end

  def test_it_returns_M_if_missed
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_it_returns_H_if_hit
    @cell_1.place_ship(@ship)
    @cell_1.fire_upon
    assert_equal "H", @cell_1.render
  end

  # test is returns "S" if cell is not empty and bool true passed in render arg
  def test_it_returns_the_s_status_when_render_is_invoked_with_true_arg
    @cell_1.place_ship(@ship)
    assert_equal "S", @cell_1.render(true)
  end

  # it should return "X" if the ship that was cotained in the cell has been sunk
  def test_it_returns_X_if_ship_occupying_cell_has_been_sunk
    # place ship in two cells (ship has 2 health)
    @cell_1.place_ship(@ship)
    @cell_2 = Cell.new("a4")
    @cell_2.place_ship(@ship)
    # ship should not be sunk
    assert_equal false, @ship.sunk?
    #fire twice
    @cell_1.fire_upon
    @cell_2.fire_upon
    #test that ship has no health and both cells respond with "X"
    assert_equal 0, @ship.health
    assert_equal "X", @cell_1.render
    assert_equal "X", @cell_2.render
  end
end
