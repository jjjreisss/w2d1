require_relative 'sliding_piece.rb'
class Rook < SlidingPiece

  def adders
    [[0,1], [1,0], [-1,0], [0,-1]]
  end

end
