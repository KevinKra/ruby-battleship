class Cell
  attr_reader :coordinate, :ship, :empty
  def initialize(coordinate, ship = nil)
    @coordinate = coordinate.upcase
    @ship = ship
    @empty = true
  end
  
  def empty?
    @empty
  end

  def place_ship(ship)
    if empty == false
      "there is already a ship placed in this cell!"
    else
      @ship = ship
      @empty = false
    end
  end
end