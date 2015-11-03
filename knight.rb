require_relative 'stepping_piece'

class Knight < SteppingPiece

  def adders
    [[1,2], [2,1], [1,-2], [2,-1], [-1,-2], [-2,-1], [-1,2], [-2,1]]
  end

end
