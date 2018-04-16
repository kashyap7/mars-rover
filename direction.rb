
class Direction
  COMPASS = ["N","E","S","W"]
  attr_accessor :compass_needle
  def initialize(dir)
    @compass_needle = COMPASS.find_index(dir)
    if @compass_needle.nil?
      puts "Invalid direction supplied defaulting to N"
      @compass_needle = 0
    end
  end

  def rotate(orientation)
    if orientation == "L"
      @compass_needle -= 1
    elsif orientation == "R"
      @compass_needle += 1
    else
      puts "Please don't give me garbage rotations, only L/R acceptable"
    end
    @compass_needle %= COMPASS.size
  end

  def state
    COMPASS[@compass_needle]
  end
end
