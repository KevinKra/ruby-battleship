require_relative "./cell.rb"

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
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    else
      puts
      puts ">> Player:"
      puts " Those are invalid coordinates. Please try again:"
      print "> "
      coordinates = gets.chomp.upcase.split(" ")
      puts
      place(ship, coordinates)
    end
  end

  def render(show_true_state = false)
    a = []
    b = "   1 2 3 4 \n "
    c = ""
    arr = ["B", "C", "D"]
    if !show_true_state
      @cells.each do |cell|
        cell_key = cell[0]
        a << @cells[cell_key].status
      end
    else
      @cells.each do |cell|
        cell_key = cell[0]
        if !@cells[cell_key].empty && @cells[cell_key].status == "."
          a << "S"
        else
          a << @cells[cell_key].status
        end
      end
    end
    a.each_with_index do |element, i|
      c.concat(" #{element}")
      if (i + 1) % 4 == 0
        c.concat(" \n")
      end
      if (i == 3 || i == 7 || i == 11)
        c.concat(" #{arr.slice!(0)}")
      end
    end
    
    b.concat("A" + c)

  end
end
