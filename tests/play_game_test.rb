require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/play_game.rb"

class PlayGameTest < Minitest::Test
  def setup
    @game = Play.new
  end

  def test_it_exists
    assert_instance_of Play, @game
  end
end