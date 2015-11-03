require 'byebug'
class Piece
  attr_reader :position, :color, :possible_directions

  def initialize(position, color, possible_directions = [])
    @position = position
    @color = color
  end

end
