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
    @starting_ships = []
  end

  def init_game
    handle_start_inputs
  end

  def handle_start_inputs
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
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    computer_player = ComputerPlayer.new
    human_player = HumanPlayer.new
    starting_ships = [cruiser, submarine]
    @computer_board = Board.new
    @player_board = Board.new
    computer_player.place_ships_on_board(starting_ships, @computer_board)
    human_player.start_game(starting_ships, @player_board)
    # start turns
    turn
  end

  def turn
    @current_turn += 1
    display_turn_boards
    shoot_prompt
  end

  def shoot_prompt
    puts
    puts "Enter the coordinate for your shot:"
    print "> "
    input_coord = gets.chomp.upcase
    puts
    puts @computer_board.cells["#{input_coord}"].fire_upon
    puts
    # puts @computer_board.render
    # puts
  end

  def display_turn_boards
    puts
    puts "              ~~~ Turn #{@current_turn} ~~~"
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
end
