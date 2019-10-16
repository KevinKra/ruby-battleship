require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/computer_player"
require_relative "../lib/board"

class ComputerPlayerTest < Minitest::Test
  def setup
    @board = Board.new
    @computer = ComputerPlayer.new
  end

  def test_it_exists
    assert_instance_of ComputerPlayer, @computer
  end



end