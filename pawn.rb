require_relative 'piece'

class Pawn < Piece
  attr_accessor :moved_yet

  def initialize(*arguments)
    super
    @moved_yet = false
  end

  def adders
    if color == :black
      if @moved_yet
        [[1,0]]
      else
        [[1,0], [2,0]]
        #add elsif for attacking diagonally once we have other pieces
      end
    elsif color == :white
      if @moved_yet
        [[-1,0]]
      else
        [[-1,0], [-2,0]]
      end
    end
  end

  def possible_moves
    possible_moves = []

    adders.each do |adder|
      possible_move = [@position[0] + adder[0], @position[1] + adder[1]]

      possible_moves.push(possible_move) if self.class.on_board?(possible_move)
    end

    possible_moves
  end

end
