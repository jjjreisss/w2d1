require_relative 'piece.rb'
class SlidingPiece < Piece

  def possible_moves
    possible_moves = []

    adders.each do |adder|
      possible_move = [@position[0] + adder[0], @position[1] + adder[1]]

      while Piece.on_board?(possible_move)
        possible_moves << possible_move.dup
        possible_move[0], possible_move[1] =
          possible_move[0] + adder[0], possible_move[1] + adder[1]
      end
    end
    possible_moves
  end

end
