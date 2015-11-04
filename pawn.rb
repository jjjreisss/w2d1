require_relative 'piece'

class Pawn < Piece
  attr_reader :board
  attr_accessor :moved_yet

  def initialize(*arguments)
    super
    @moved_yet = false
  end

  def adders
    adders = []
    if color == :black
      one_straight = board[self.position[0]+1, self.position[1]]
      adders << [1,0] unless one_straight
      two_straight = board[self.position[0]+2, self.position[1]]
      adders << [2,0] unless @moved_yet || two_straight

      diag_left = board[self.position[0]+1, self.position[1]+1]
      if diag_left && diag_left.color == :white
        adders << [1,1]
      end
      diag_right = board[self.position[0]+1, self.position[1]-1]
      if diag_right && diag_right.color == :white
        adders << [1,-1]
      end
    end

    if color == :white
      one_straight = board[self.position[0]-1, self.position[1]]
      adders << [-1,0] unless one_straight
      two_straight = board[self.position[0]-2, self.position[1]]
      adders << [-2,0] unless @moved_yet || two_straight

      diag_left = board[self.position[0]-1, self.position[1]+1]
      if diag_left && diag_left.color == :black
        adders << [-1,1]
      end
      diag_right = board[self.position[0]-1, self.position[1]-1]
      if diag_right && diag_right.color == :black
        adders << [-1,-1]
      end
    end
    adders
  end



  def possible_moves
    possible_moves = []

    adders.each do |adder|
      possible_move = [@position[0] + adder[0], @position[1] + adder[1]]
      possible_moves << possible_move if self.class.on_board?(possible_move)
    end

    possible_moves
  end

end
