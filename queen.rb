require_relative 'sliding_piece'
class Queen < SlidingPiece

  def intialize(position, color, possible_directions = ["orthogonal", "diagonal"])
    @position = position
    @color = color
    @possible_directions = possible_directions
  end

end
