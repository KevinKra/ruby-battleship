class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon, :render
  def initialize(coordinate, ship = nil)
    @coordinate = coordinate.upcase
    @ship = ship
    @empty = true
    @fired_upon = false
    @render = "."
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

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @fired_upon == true
      return "You've already targeted this coord, wut u doin"
    end 
    @fired_upon = true
    if empty == true
      @render = "M"
      "you missed lul"
    else
      @render = "H"
      @ship.hit
    end
  end

  # Resolve the render issue, prop vs method
  def render(bool)
    if bool == true
      if @empty == false
        "S"
      end
    end
  end
end