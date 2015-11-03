require_relative 'stepping_piece'

class King < SteppingPiece

  def initialize(position, color, possible_directions = ["orthogonal", "diagonal"])
    @position = position
    @color = color
    @possible_directions = possible_directions
  end
  
end
