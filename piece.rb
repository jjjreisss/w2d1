require_relative 'board'
require 'byebug'
class Piece
  attr_reader :color, :piece_type
  attr_accessor :position

  def initialize(board, position, color, piece_type)
    @board = board
    @position = position
    @color = color
    @piece_type = piece_type
  end

  def self.on_board?(position)
    position.all? { |coordinate| coordinate.between?(0, 7) }
  end

end
