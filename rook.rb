require_relative 'sliding_piece.rb'
class Rook < SlidingPiece

  def initialize(position, color, possible_directions = ["orthogonal"])
    @position = position
    @possible_directions = possible_directions
    @color = color
  end

end
