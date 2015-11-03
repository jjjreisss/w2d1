require_relative 'sliding_piece'
class Bishop < SlidingPiece

  def possible_directions
    ["diagonal"]
  end
  
end
