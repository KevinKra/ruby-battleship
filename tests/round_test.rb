require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/computer_player'
require_relative '../lib/live_player'
require_relative '../lib/round'
require_relative '../lib/board'


class RoundTest < Minitest::Test
  def setup
    @round = Round.new
    @board = Board.new

    @cells = @board.generate_game

    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    @player_board = {}
    @computer_board = {}

    @computer_board = Board.new
    @computer_board.generate_game
    @computer_player = ComputerPlayer.new

    @player_board = Board.new
    @player_board.generate_game
    @live_player = LivePlayer.new
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_game_setup_computer
    assert_instance_of Board, @computer_board
    assert_instance_of ComputerPlayer, @computer_player

    assert_instance_of Board, @player_board
    assert_instance_of LivePlayer, @live_player

    # returns nil for the actual - ask Kevin for help
    assert_equal @computer_board.generate_game, @board
  end
end
