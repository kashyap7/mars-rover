
class Landscape
  def initialize(boundary)
    if boundary[0] < 0 || boundary[1] < 0
      raise ArgumentError.new("Plateau valid only in positive cartesian plane")
    end 
    @topright = boundary
    @landmarks = {}
  end

  def sane(position)
    if position[0] < 0 || position[0] > @topright[0]
      return false
    elsif position[1] < 0 || position[1] > @topright[1]
      return false
    else
      return !(@landmarks.has_key? position)
    end 
  end

  def add_landmark(position)
    @landmarks.merge!({position => true})
  end
end
