require_relative 'stepping_piece'

class Knight < SteppingPiece

  def initialize(position, color, possible_directions = ["knight"])
    @position = position
    @color = color
    @possible_directions = possible_directions
  end

end
