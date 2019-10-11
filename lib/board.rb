require_relative './cell'
require_relative './ship'
require 'pry'

class Board

attr_reader :board, :cells

def initialize
  @board = board
  @cells = generate_game
  @alphabetical_array = []
  @numerical_array = []
end

  def generate_game
    coordinates = [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4" ]
        cell_hash = {}
        coordinates.each do |coordinate|
        cell_hash["#{coordinate}"] = Cell.new(coordinate)
      end
    pp cell_hash
  end

  def valid_coordinate(coord)
    @cells.has_key?(coord)
  end

  def valid_placement?(ship, coords)
    ship.length == coords.length
    valid = []
    coords.each do |coord|
      matching_coord = @cells[coord]
      valid << matching_coord.empty?
    end
    check_elements_empty(valid)
    #coordinates are consecutive

    #add check for coordinates not on the board

  end

  def check_elements_empty(array)
    #we're checking that all cells are empty (@empty == true),
    #if any are filled (@empty == false) validator will detect the
    #false boolean and return true
    output = array.include?(false)
    !output
  end

#new method for output
#split into hash
#look into uniq

  def create_output(split_strings)
    output = []
    split_strings.each do |element|
      output << element.split('')
    end
  end

    def letter_split(letter_output)
    letter_output.each do |element|
      @alphabetical_array << element[0]
    end
  @alphabetical_array
  end

  def number_split(number_output)
      @numerical_array << element[1]
    end
    @numerical_array
  end


  def check_if_sequential(location)
      letter = @alphabetical_array.first
      letters_result = @alphabetical_array.find_all { |element| element == letter}

      number = @numerical_array.first
      number_result = @numerical_array.find_all { |element| element == number}

      # sorted_ = @alphabetical_array.sort
      # ordered_array = @numerical_array.sort


    if (letters_result.length == @alphabetical_array.length) && (@numerical_array.sort == @numerical_array) && ((@numerical_array[0]..@numerical_array[-1]) == @numerical_array)
      true
    elsif
        (number_result.length == @numerical_array.length) && (@alphabetical_array.sort == @alphabetical_array) && ((@alphabetical_array[0]..@alphabetical_array[-1]) == @alphabetical_array)
        true

        else false
      end
#      @alphabetical_array
    end
