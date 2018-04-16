
require_relative 'landscape.rb'
require_relative 'direction.rb'
require_relative 'rover.rb'
require_relative 'operator.rb'

#Fetching the topright corner which would mark the plateau for us
topright = gets
topright = topright.split(" ").map(&:to_i)
plateau = Landscape.new(topright)

while line = gets
  # setup the rover
  # get the statrt position and direction
  position = line.split(" ")
  direction = Direction.new(position[2])
  rover = Rover.new(direction, position[0,2].map(&:to_i), plateau)

  commands = gets.chomp
  Operator.new(rover).navigate commands 
  # Add the final position of the rover to the landmarks on the plateau
  plateau.add_landmark(rover.position)
  rover.dump_state
end
