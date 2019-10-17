require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/game.rb"

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_greets_player_on_game_start
    skip
    line1 = "Welcome to BATTLESHIP Enter 'P' to play. Press 'Q' to quit. > "
    line2 = "Enter 'P' to play. Press 'Q' to quit."
    line3 = "> "
    
    assert_output line1, @game.start_game
  end

  # def test_it_handles_incorrect_start_inputs

  # end

  # def test_it_handles_start_input_P

  # end

  # def test_it_handles_start_input_Q

  # end
end