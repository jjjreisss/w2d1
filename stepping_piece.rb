require_relative 'piece'

class SteppingPiece < Piece

  def possible_moves
    possible_moves = []

    adders.each do |adder|
      possible_move = [@position[0] + adder[0], @position[1] + adder[1]]

      possible_moves.push(possible_move) if self.class.on_board?(possible_move)
    end

    possible_moves
  end
end
