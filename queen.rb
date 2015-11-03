require_relative 'sliding_piece'
class Queen < SlidingPiece

  def possible_directions
    ["diagonal", "orthogonal"]
  end

end
