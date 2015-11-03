require_relative 'sliding_piece'
class Queen < SlidingPiece

  def adders
    [[0,1], [1,0], [-1,0], [0,-1], [1,1], [1,-1], [-1,-1], [-1,1]]
  end

end
