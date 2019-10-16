class ComputerPlayer
  def initialize

  end

  def place_ships_on_board(total_ships, board)
    placement = generate_placement(total_ships, board)
    p placement
    board.place(total_ships[1], placement)
  end

  def generate_placement(ships_to_place, board)
    # determine currently available cells
    open_cells = board.cells.select {|key, value| value.empty == true}.map() { |key, value| key}
    ship_size = ships_to_place[1].length
    if open_cells.length != 0
      starting_letter = open_cells.sample.split('')[0]
    else
      puts "There are no more available cells."
    end

    possible_placement = open_cells.select {|coord| coord.split('').include?(starting_letter)}

    until possible_placement.length >= ship_size do 
      possible_placement = open_cells.select {|coord| coord.split('').include?(starting_letter)}
    end

    if possible_placement.length == ship_size
      return possible_placement
    else possible_placement.length > ship_size
      return possible_placement[0..ship_size - 1]
    end

  end


end