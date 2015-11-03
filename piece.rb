require 'byebug'
class Piece
  attr_reader :position, :color, :possible_directions

  def initialize(position, color, possible_directions = [])
    @position = position
    @color = color
  end

  def self.on_board?(position)
    position.all? { |coordinate| coordinate.between?(0, 7) }
  end

end
