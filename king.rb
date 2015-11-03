require_relative 'stepping_piece'

class King < SteppingPiece

#  def initialize
#    super
#    @possible_direction = ["orthogonal", "diagonal"]
#  end

  def possible_directions
    ["orthoginal", "diagonal"]
  end

end
