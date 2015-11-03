require_relative 'stepping_piece'

class King < SteppingPiece

#  def initialize
#    super
#    @possible_direction = ["orthogonal", "diagonal"]
#  end

  def adders
    [[1,0],[0,1],[-1,0],[0,-1],[1,1],[1,-1],[-1,1],[-1,-1]]
  end
end
