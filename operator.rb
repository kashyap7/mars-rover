
class Operator
  attr_accessor :rover

  def initialize(rover)
    @rover = rover
  end

  def navigate(commands)
    commands.each_char do |command|
      case command
        when 'L', 'R'
          @rover.rotate(command)
        when 'M'
          return if @rover.move == "STOP"
        else
          puts "Please don't send garbage commands, don't you kid with NASA!"
      end
    end
  end
end
