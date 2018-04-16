
class Rover
  attr_accessor :position
  def initialize(direction, position, landscape)
    @direction = direction
    @landscape = landscape
    if @landscape.sane(position)
      @position = position
    else
      raise ArgumentError.new("Rover not in the plateau")
    end
  end

  def move
    new_position = @position.clone
    case @direction.state
      when "N"
        new_position[1] += 1
      when "S"
        new_position[1] -= 1
      when "E"
        new_position[0] += 1
      when "W"
        new_position[0] -= 1
    end

    if @landscape.sane(new_position) 
      @position = new_position
    else
      puts "We stop just before collide a rover or fall off the cliff"
      return "STOP"
    end
  end

  def rotate(orientation)
    @direction.rotate(orientation)
  end

  def dump_state
    puts "#{@position[0]} #{@position[1]} #{@direction.state}"
  end
end
