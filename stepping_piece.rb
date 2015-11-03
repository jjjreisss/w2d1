require_relative 'piece'

class SteppingPiece < Piece

  def possible_moves
    #debugger
    adders = []
    possible_directions.each do |direction|
      adders += [[0,1], [1,0]] if direction == "orthogonal"
      adders += [[1,1], [1,-1]] if direction == "diagonal"
      adders += [[1,2], [2,1], [1,-2], [2,-1]] if direction == "knight"
    end

    possible_moves = []

    adders.each do |adder|
      negative_move = [@position[0] - adder[0], @position[1] - adder[1]]
      positive_move = [@position[0] + adder[0], @position[1] + adder[1]]

      possible_moves.push(negative_move) if self.class.on_board?(negative_move)
      possible_moves.push(positive_move) if self.class.on_board?(positive_move)
    end

    possible_moves
  end
end
