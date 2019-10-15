class Play
  attr_accessor :play_game, :start_game

  def initialize
    @play_game = false
  end

  def start_game
    puts "Welcome to BATTLESHIP"
    puts "Enter 'P' to play. Press 'Q' to quit."
    print "> "
    user_input = gets.chomp

    while user_input.downcase != "p" || user_input.downcase != "q" do
      puts "Please enter a valid command."
      print "> "
      user_input = gets.chomp

    if user_input.downcase == "p"
      @play_game = true
    elsif user_input.downcase == "q"
      puts "Goodbye!"
    end
    end
  end
end
