require 'byebug'
class Piece
  attr_reader :position

  def initialize(position)
    @position = position
  end

end

class SlidingPiece < Piece
  attr_reader :possible_directions

  def initialize(position, possible_directions = [])
    @position = position
    @possible_directions = possible_directions
  end

  def possible_moves
    #debugger
    adders = []
    possible_directions.each do |direction|
      adders += [[0,1], [1,0]] if direction == "orthogonal"
      adders += [[1,1], [1,-1]] if direction == "diagonal"
    end

    possible_moves = []

    adders.each do |adder|
      negative_move = [@position[0] - adder[0], @position[1] - adder[1]]
      positive_move = [@position[0] + adder[0], @position[1] + adder[1]]
      while SlidingPiece.on_board?(negative_move)
        possible_moves << negative_move.dup
        negative_move[0], negative_move[1] =
          negative_move[0] - adder[0], negative_move[1] - adder[1]
      end
      while SlidingPiece.on_board?(positive_move)
        possible_moves << positive_move.dup
        positive_move[0], positive_move[1] =
          positive_move[0] + adder[0], positive_move[1] + adder[1]
      end
      # possible_moves << positive_move
      # possible_moves << negative_move
    end

    possible_moves

  #  possible_moves.select { |possible_move| SlidingPiece.on_board?(possible_move) }
  end

  def self.on_board?(position)
    position.all? { |coordinate| coordinate.between?(0, 7) }
  end

end
