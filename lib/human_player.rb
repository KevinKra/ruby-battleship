class HumanPlayer
  def initialize
    
  end

  def start_game(total_ships, board)
    notify_start_game
    place_ships(total_ships, board)
  end

  def notify_start_game
    print ">> Player:"
    puts "\n You now need to lay out your two ships." + "\n The Cruiser is three units long and the Submarine is two units long. \n"
    puts
  end

  def place_ships(ships, board)
    puts board.render(true)
    ships.each do |ship|
      puts
      puts ">> Player:"
      puts " Enter the squares for the #{ship.name} (#{ship.length} places):"
      print "> "
      input = gets.chomp.upcase().split(" ")
      puts "------------"
      puts
      # !still need to validate
      board.place(ship, input)
      puts board.render(true)
      puts
    end
  end
end