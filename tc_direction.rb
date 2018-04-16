
require_relative 'direction.rb'
require 'test/unit'

class TestDirection < Test::Unit::TestCase
  def test_d
    # N -> rotate left -> W
    dir = Direction.new("N")
    dir.rotate("L")
    assert_equal("W", dir.state)
    # N -> roate right -> E
    dir.compass_needle = Direction::COMPASS.find_index("N")
    dir.rotate("R")
    assert_equal("E", dir.state)

    # W -> rotate right -> N
    dir.compass_needle = Direction::COMPASS.find_index("W")
    dir.rotate("R")
    assert_equal("N", dir.state)
  end
end
