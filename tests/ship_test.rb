require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/ship.rb";

class ShipTest < Minitest::Test
  def setup
    @ship = Ship.new("cruiser", 3)
  end
  # it should exist
  def test_it_should_exist
    assert_instance_of Ship, @ship 
  end
  # newly instantiated objects should accept a name and length argument
  def test_it_has_a_name_and_length_argument
    assert_equal "cruiser", @ship.name
    assert_equal 3, @ship.length
  end

  # it should return a value when health when object.health is invoked
  def test_it_has_a_health_attribute
    assert_equal 3, @ship.health 
  end

  # it should return boolean when object.sunk? method is invoked
  def test_it_returns_a_boolean_when_sunk_method_is_called
    # Should not be sunk by default
    assert_equal false, @ship.sunk?
  end

  # it should return a value when hit when object.hit is invoked
  def test_hit_reduces_the_health_of_the_ship
    assert_equal @ship.health, @ship.length
    @ship.hit
    assert_equal @ship.health, @ship.length - 1 
    @ship.hit
    assert_equal @ship.health, @ship.length - 2
  end

  # it should return true when object.sunk? is called and @health equals 0
  def test_sunk_returns_true_when_ship_health_is_zero
    assert_equal false, @ship.sunk?
    for health in 1..@ship.length
      @ship.hit
    end
    assert_equal 0, @ship.health
    assert_equal true, @ship.sunk
  end
end