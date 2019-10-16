require 'pry'

class Board

  attr_reader :board
  attr_accessor :empty, :cells

  def initialize
    @board = board
    @cells = {}
  end

  def generate_game
    coordinates = [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4" ]
      coordinates.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
    coordinates
  end

  def valid_coordinate?(coord)
    @cells.keys.include?(coord)
  end

  def valid_placement?(ship, desired_coords)
    coords_empty_status = []
    if ship.length == desired_coords.length
      desired_coords.each do |coord|
        coords_empty_status << @cells[coord].empty?
        # check each coordinate and shovel boolean accordingly.
      end
    else
      return false
    end
    if !coords_empty_status.include?(false)
      # determine if all the booleans are true (true means the coord is not already occupied).
      # If all bools == true, this means ship can be placed.
        parsed_coords = parse_coordinates(desired_coords)
        verify_placement_format(parsed_coords)
    else
      return false
    end
  end

  def parse_coordinates(coordinates)
    parsed_coords = [[], []]
    coordinates.each do |coordinate|
      letter_number = coordinate.split('')
      parsed_coords[0] << letter_number[0]
      parsed_coords[1] << letter_number[1]
    end
    parsed_coords
    # input coords: ["A1", "A2"]
    # parsed output: [["A", "A"], ["1", "2"]]
  end

  def is_valid_horizontal_placement(board_alpha_locations, board_numeric_locations, letters_result)
    (letters_result.length == board_alpha_locations.length) && (board_numeric_locations.sort == board_numeric_locations) && ((board_numeric_locations[0]..board_numeric_locations[-1]).to_a == board_numeric_locations)
  end

  def is_valid_vertical_placement(board_alpha_locations, board_numeric_locations, number_result)
    (number_result.length == board_numeric_locations.length) && (board_alpha_locations.sort == board_alpha_locations) && ((board_alpha_locations[0]..board_alpha_locations[-1]).to_a == board_alpha_locations)
  end

  # Input: ["A1", "A2"]
  # Output: true / false
  def verify_placement_format(board_locations_to_check)
    board_alpha_locations = board_locations_to_check[0]
    board_numeric_locations = board_locations_to_check[1]

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
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
    @cells
  end

  def render
    a = []
    b = "  1 2 3 4 \n "
    c = ""
    arr = ["B", "C", "D"]
    @cells.each do |cell|
      cell_key = cell[0]
      a << @cells[cell_key].status
    end
    a.each_with_index do |element, i|
      c.concat(" #{element}")
      if (i + 1) % 4 == 0
        c.concat("\n")
      end
      if (i == 3 || i == 7 || i == 11)
        c.concat(" #{arr.slice!(0)}")
      end
    end

    d = b + "A" + c
  end
end
