require 'pry'

class Board

attr_reader :board, :cells
attr_accessor :empty

def initialize
  @board = board
  @cells = generate_game
end

  def generate_game
    coordinates = [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4" ]
    cell_hash = {}
    coordinates.each do |coordinate|
      cell_hash["#{coordinate}"] = Cell.new(coordinate)
    @board = coordinates
    end
    cell_hash
  end

  def valid_coordinate?(coord)
    @cells.has_key?(coord)
  end


  def valid_placement?(ship, coords)
    valid = []
    if ship.length == coords.length
     coords.each do |coord|
      valid << @cells[coord].empty?
      # check each coordinate and shovel boolean accordingly.
      end
    end
    check_elements_empty(valid)
    # determine if all the booleans are true. If true, this means ship can be placed.
  end

  def check_elements_empty(array)
    output = array.include?(false)
    !output
  end

  # Input: ["A1", "A2"]
  # Output: [["A", "A"], ["1", "2"]]
  # If this was a hash, the output could be: { location_letters: ["A", "A"], location_numbers: ["1", "2"] }
  def create_output(board_locations_to_check)
    split_board_locations = [[], []]
    board_locations_to_check.each do |board_location|
      board_location_letter_and_number = board_location.split('')
      split_board_locations[0] << board_location_letter_and_number[0]
      split_board_locations[1] << board_location_letter_and_number[1]
    end
    split_board_locations
  end

  def is_valid_horizontal_placement(board_alpha_locations, board_numeric_locations, letters_result)
    (letters_result.length == board_alpha_locations.length) && (board_numeric_locations.sort == board_numeric_locations) && ((board_numeric_locations[0]..board_numeric_locations[-1]).to_a == board_numeric_locations)
  end

  def is_valid_vertical_placement(board_alpha_locations, board_numeric_locations, number_result)
    (number_result.length == board_numeric_locations.length) && (board_alpha_locations.sort == board_alpha_locations) && ((board_alpha_locations[0]..board_alpha_locations[-1]).to_a == board_alpha_locations)
  end

  # Input: ["A1", "A2"]
  # Output: true / false
  def check_if_sequential(board_locations_to_check)
    split_board_locations = create_output(board_locations_to_check) # [["A", "1"], ["A", "2"]]
    board_alpha_locations = split_board_locations[0]
    board_numeric_locations = split_board_locations[1]

    letter_first = board_alpha_locations.first
    letters_result = board_alpha_locations.find_all { |element| element == letter_first}

    number_first = board_numeric_locations.first
    number_result = board_numeric_locations.find_all { |element| element == number_first}


    if is_valid_horizontal_placement(board_alpha_locations, board_numeric_locations, letters_result)
      true
    elsif is_valid_vertical_placement(board_alpha_locations, board_numeric_locations, number_result)
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    @cell.place_ship(ship)
  end
end
