require_relative 'sliding_piece'
class Bishop < SlidingPiece

  def adders
    [[1,1], [1,-1], [-1,-1], [-1,1]]
  end

end
