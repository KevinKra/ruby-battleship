require_relative './cell'
require_relative './ship'
require 'pry'

class Board

attr_reader :board, :cells

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
  end
  cell_hash
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

    #add check for "A5"

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

  def check_if_sequential(array)
    output = []
    array.each do |element|
    output << element.split('')
    end

    alphabetical_array = []
    numerical_array = []

    output.each do |element|
      alphabetical_array << element[0]
      numerical_array << element[1]
    end

    def compare_sort(num_array, alph_array)
      letter = alph_array.first
      letters_result = alph_array.find_all { |element| element == letter}

      number = num_array.first
      number_result = num_array.find_all { |element| element == number}

      ordered_array = num_array.sort
      a_array = alph_array.sort

      # binding.pry
    if (letters_result.length == alph_array.length) && (num_array.sort == num_array) && ((num_array[0]..num_array[-1]).to_a == num_array)
      true
    elsif
        (number_result.length == num_array.length) && (alph_array.sort == alph_array) && ((alph_array[0]..alph_array[-1]).to_a == alph_array)
        true

        else false
      end
    end
    compare_sort(numerical_array, alphabetical_array)
  end
end
