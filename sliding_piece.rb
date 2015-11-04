require_relative 'piece.rb'
class SlidingPiece < Piece

  attr_reader :board

  def possible_moves
    possible_moves = []

    adders.each do |adder|
      possible_move = [@position[0] + adder[0], @position[1] + adder[1]]

      while Piece.on_board?(possible_move) && board[*possible_move].nil?
        possible_moves << possible_move.dup
        possible_move[0], possible_move[1] =
          possible_move[0] + adder[0], possible_move[1] + adder[1]
      end

      # when we hit a piece - see if it's the same color as self;
      # if not, include it in possible moves;
      # if so, do not include it, and stop creating more possible_moves
      # in this direction
      if Piece.on_board?(possible_move) && board[*possible_move].color != color
        possible_moves << possible_move
      end
    end
    possible_moves
  end

end
