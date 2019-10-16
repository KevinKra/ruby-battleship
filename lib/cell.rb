class Cell
  attr_reader :coordinate, :ship, :fired_upon, :status
  attr_accessor :empty
  
  def initialize(coordinate, ship = nil)
    @coordinate = coordinate.upcase
    @ship = ship
    @empty = true
    @fired_upon = false
    @status = "."
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    if empty == false
      "There is already a ship placed in this cell!"
    else
      @ship = ship
      @empty = false
    end
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @fired_upon == true
      return "You've already targeted this coordinate!"
    end
    @fired_upon = true
    if empty == true
      @status = "M"
      "Your shot on #{@coordinate} was a miss."
    else
      @status = "H"
      @ship.hit
      "That's a hit!"
    end
  end

  # Resolve the render issue, prop vs method
  def render(bool = false)
    if bool && !@empty
      return "S"
    end
    if @ship != nil && @ship.sunk
      return "X"
    end
    @status
  end
end
