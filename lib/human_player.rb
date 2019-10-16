class HumanPlayer
  def initialize
    
  end

  def start_game(total_ships, board)
    notify_start_game
    place_ships(total_ships, board)
  end

  def notify_start_game
    puts "\n You now need to lay out your two ships." + "\n The Cruiser is two units long and the Submarine is three units long. \n"
  end

  def place_ships(ships, board)
    puts board.render(true)
    ships.each do |ship|
      puts "Enter the squares for the #{ship.name} (#{ship.length} places):"
      input = gets.chomp.upcase().split(" ")
      # !still need to validate
      p input
      board.place(ship, input)
      puts board.render(true)
    end
  end
end