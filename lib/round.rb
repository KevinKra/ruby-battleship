# attr
#
# generate_game
# sample
# until
#
# board.sample(ship_placement)
# until ship_placement
class Round


  def initialize
     @computer_board = {}
     @player_board = {}
  end

  def create_boards
    @computer_board = Board.new
    @computer_board.generate_game

    @player_board = Board.new
    @player_board.generate_game
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
       player_cruiser_placement
     elsif player_ship_selection == "Submarine"
       player_submarine_placement
     #placeholder
     else
       puts "?"
     end
  end

  def player_cruiser_placement
    puts "You have selected to place the Cruiser. Please enter three coordinates:"
    print "> "
    player_ship_coordinates = gets.chomp
    split_player_coords = player_ship_coordinates.split(',')
    until @player_boardgame.valid_placement?(ship, split_player_coords) == true
      puts "The coordinates are not valid, please try again."
      p "> "
    end
  end

  def player_submarine_placement
    puts "You have selected to place the Submarine. Please enter two coordinates:"
    print "> "
    player_ship_coordinates = gets.chomp
    player_ship_coordinates.split(',')
  end

  def turn
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
