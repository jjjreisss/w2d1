require_relative 'board'
require 'byebug'
class Piece
  attr_reader :position, :color

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def self.on_board?(position)
    position.all? { |coordinate| coordinate.between?(0, 7) }
  end

end
