require_relative "../lib/computer_player.rb"
require_relative "../lib/human_player.rb"
require_relative "../lib/board.rb"


class Game
  attr_reader :computer_board, :player_board

  def initialize
    @play_game = false
    @current_turn = 0
    @computer_board = {}
    @player_board = {}
    @starting_ships_computer = []
    @starting_ships_player = []
    @human_player = {}
    @computer_player = {}
  end

  def init_game
    handle_start_inputs
  end

  def handle_start_inputs
    puts
    puts "=========================================="
    puts
    puts "         Welcome to BATTLESHIP"
    puts "   Enter 'P' to play. Press 'Q' to quit."
    puts
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
      start_game
    elsif user_input == "Q"
        puts "Goodbye!"
    else 
      puts "Please enter a valid command."
      print "> "
      user_input = gets.chomp
    end
  end

  def start_game
    # set up game and place ships
    setup_game
    # take turns
    until (detect_fleet_health(@computer_player) || detect_fleet_health(@human_player))
      take_turn
    end
    # end game
    display_game_end
  end

  def take_turn
    @current_turn += 1
    display_turn_boards
    shooting_phase
  end

  def shooting_phase
    puts
    puts "Enter the coordinate for your shot:"
    print "> "
    @human_player.shoot(@computer_board)
    @computer_player.shoot(@player_board)
  end

  def detect_fleet_health(player)
    output = player.ships.map do |ship|
      ship.sunk?
    end
    sunk_ships = output.find_all { |ship_sunk| ship_sunk == true }.length
    if sunk_ships == player.ships.length
      # end game
      # there are the same number as sunk ships as there are ships.
      true
    else
      # continue game
      # there are less sunk ships than there are total ships.
      false
    end
  end

  def display_turn_boards
    puts 
    puts "             ~~~ Turn #{@current_turn} ~~~"
    puts
    puts "=============COMPUTER BOARD============="
    puts
    puts @computer_board.render
    puts
    puts "==============PLAYER BOARD=============="
    puts
    puts @player_board.render(true)
    puts
  end

  def display_game_end
    computer = detect_fleet_health(@human_player)
    puts
    puts "=========================================="
    puts
    puts "             ~~~ GAME OVER ~~~"
    computer ? human_wins(false) : human_wins(true)
    puts 
    puts "           ~~~ Final Result ~~~"
    puts "=============COMPUTER BOARD============="
    puts
    puts @computer_board.render(true)
    puts
    puts "==============PLAYER BOARD=============="
    puts
    puts @player_board.render(true)
    puts
    puts "Wish to play again? (Y/N)"
    print "> "
    user_input = gets.chomp.upcase
    if user_input == "Y"
      init_game
    else
      puts "Ok, Bye!"
    end
  end

  def human_wins(outcome)
    if outcome
      puts 
      puts "|========================================|"
      puts "|==== WINNER ==== WINNER ==== WINNER ====|"
      puts "|========================================|"
      puts "|----------->   YOU WON!!    <-----------|"
      puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
      puts "|========================================|"
      puts
    else
      puts 
      puts "|========================================|"
      puts "|==== LOSER! ==== LOSER! ==== LOSER! ====|"
      puts "|========================================|"
      puts "|----------->   YOU LOST!   <------------|"
      puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
      puts "|================SORRY===================|"
      puts
    end
  end

   def setup_game
    submarine1 = Ship.new("Submarine", 2)
    cruiser1 = Ship.new("Cruiser", 3)
    submarine2 = Ship.new("Submarine", 2)
    cruiser2 = Ship.new("Cruiser", 3)
    @computer_player = ComputerPlayer.new
    @human_player = HumanPlayer.new
    @starting_ships_computer = [cruiser1, submarine1]
    @starting_ships_player = [cruiser2, submarine2]
    @computer_board = Board.new
    @player_board = Board.new
    @computer_player.place_ships_on_board(@starting_ships_computer, @computer_board)
    @human_player.start_game(@starting_ships_player, @player_board)
   end
end
