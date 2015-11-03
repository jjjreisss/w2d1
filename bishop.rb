require_relative 'sliding_piece'
class Bishop < SlidingPiece

  def intialize(position, color, possible_directions = ["diagonal"])
    @position = position
    @color = color
    @possible_directions = possible_directions
  end

end
