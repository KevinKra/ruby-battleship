class Ship
  attr_reader :name, :length, :health, :sunk
   def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def sunk?
    @sunk
  end
  
  def hit
    @health -= 1
    puts "#{@name} health: #{@health}"
    @sunk = true if @health == 0
    puts "sunk? #{@sunk}"
  end
end