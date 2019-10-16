require_relative "./board"
require_relative "./cell"
require_relative "./ship"
require_relative "./cell"
require_relative  "./play_game"
require_relative "./computer_player"
require_relative  "./live_player"

class Round

attr_accessor :computer_player, :live_player

  def initialize (computer_player = nil, live_player = nil)
     game_setup
     @computer_player = computer_player
     @live_player = live_player
  end

  def game_setup

    @computer_board = Board.new
    @computer_board.generate_game
    @computer_player = ComputerPlayer.new

    @player_board = Board.new
    @player_board.generate_game
    @live_player = LivePlayer.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    @computer_player.add_computer_ships(cruiser)
    @computer_player.add_computer_ships(submarine)
  end

  def ships_placed_by_computer
    #.sample
    puts "I have laid out my ships on the grid. \n You now need to lay out your two ships.
     \n The Cruiser is three units long and the Submarine is two units long. Would you like to place the cruiser or submarine first?"
     print "> "
  end

  def user_ship_placement
     player_ship_selection = gets.chomp
     if player_ship_selection == "Cruiser"
       cruiser = Ship.new("Cruiser", 3)
       submarine = Ship.new("Submarine", 2)
       player_ship_placement(cruiser)
       player_ship_placement(submarine)
     elsif player_ship_selection == "Submarine"
       submarine = Ship.new("Submarine", 2)
       cruiser = Ship.new("Cruiser", 3)
       player_ship_placement(submarine)
       player_ship_placement(cruiser)
       # require 'pry', binding.pry
     end
  end

#runner
  def player_ship_placement(ship)
    puts "You have selected to place the #{ship.name}. Please enter #{ship.length} coordinates:"
    print "> "
    player_ship_coordinates = gets.chomp
    split_player_coords = player_ship_coordinates.split(',')
    until @player_board.valid_placement?(ship, split_player_coords) == true
      puts "The coordinates are not valid, please try again."
      p "> "
      player_ship_coordinates = gets.chomp
      split_player_coords = player_ship_coordinates.split(',')
    end
    puts "Your #{ship.name} has been placed. "
    @player_board.place(ship, split_player_coords)
    @player_board.render
  end

  def turn
  end

end
  # The Turn
  # During the main game, players take turns firing at one another by selecting positions on the grid to attack.
  #
  # A single turn consists of:
  #
  # Displaying the boards
  # Player choosing a coordinate to fire on
  # Computer choosing a coordinate to fire on
  # Reporting the result of the Player’s shot
  # Reporting the result of the Computer’s shot
