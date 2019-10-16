class ComputerPlayer
  def initialize

  end

  def place_ships_on_board(total_ships, board)
    total_ships.each do |ship|
      placement = generate_placement(ship, board)
      board.place(ship, placement)
    end
    notify_placement_complete
  end

  def generate_placement(ship, board)
    # This (yet) does not deal with oversaturation edge cases.
    # determine currently available cells
    open_cells = board.cells.select {|key, value| value.empty == true}.map() { |key, value| key}
    starting_letter = open_cells.sample.split('')[0] 

    possible_placement = []
    until possible_placement.length >= ship.length do 
      possible_placement = open_cells.select {|coord| coord.split('').include?(starting_letter)}
    end

    possible_placement.length == ship.length ? 
      possible_placement : 
      possible_placement[0..ship.length - 1]
  end

  def notify_placement_complete
    puts
    puts ">> Computer:"
    puts " I have laid out my ships on the grid."
    puts
  end
end