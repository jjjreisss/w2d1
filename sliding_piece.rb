require_relative 'piece.rb'
class SlidingPiece < Piece

  def possible_moves
    #debugger
    adders = []
    possible_directions.each do |direction|
      adders += [[0,1], [1,0], [-1,0], [0,-1]] if direction == "orthogonal"
      adders += [[1,1], [1,-1], [-1,-1], [-1,1]] if direction == "diagonal"
    end

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
