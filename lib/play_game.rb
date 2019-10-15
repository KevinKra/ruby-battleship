class Play
  attr_accessor :play_game, :start_game

  def initialize
    @play_game = false
  end

  def start_game
    puts "Welcome to BATTLESHIP"
    puts "Enter 'P' to play. Press 'Q' to quit."
    print "> "
    user_input = gets.chomp.upcase

    until user_input == "P" || user_input == "Q" do 
      puts "Please enter a valid command."
      print "> "
      user_input = gets.chomp.upcase
    end

    if user_input == "P"
      @play_game = true
      puts "Game Started!"
    elsif user_input == "Q"
        puts "Goodbye!"
    else 
      puts "Please enter a valid command."
      print "> "
      user_input = gets.chomp
    end
    
  end
end
