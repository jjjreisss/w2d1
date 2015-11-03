require_relative 'sliding_piece.rb'
class Rook < SlidingPiece

  def possible_directions
    ["orthogonal"]
  end

end
