require_relative 'errors'
require_relative 'piece'
#WHY DONT WE NEED TO REQUIRE PIECE HERE

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
  end

  def [](row, column)
    @grid[row][column]
  end

  def []=(row, column, value)
    @grid[row][column] = value
  end

  def ==(row, column, value)
    @grid[row][column] == value
  end

  def nil?(row, column)
    @grid[row][col] == nil
  end

  def move(start_pos, end_pos)
    raise BlankSpaceError.new "ERROR" unless self[*start_pos]
    # raise ArgumentError.new "Invalid move" unless valid_move?[]
    # self[*start_pos].nil?
      p self[*start_pos].possible_moves
    if valid_move?(start_pos, end_pos)
      self[*end_pos] = self[*start_pos]
      # DUP IS NECESSARY BELOW
      self[*end_pos].position = end_pos.dup
      self[*start_pos] = nil
    end #make this an else later, to handle if it is not a valid move
  end

  def populate
    #populate white pieces
    self[7,0] = Rook.new(self, [7,0], :white, :w_rook)
    self[7,1] = Knight.new(self, [7,1], :white, :w_knight)
    self[7,2] = Bishop.new(self, [7,2], :white, :w_bishop)
    self[7,3] = Queen.new(self, [7,3], :white, :w_queen)
    self[7,4] = King.new(self, [7,4], :white, :w_king)
    self[7,5] = Bishop.new(self, [7,5], :white, :w_bishop)
    self[7,6] = Knight.new(self, [7,6], :white, :w_knight)
    self[7,7] = Rook.new(self, [7,7], :white, :w_rook)
    self[6,0] = Pawn.new(self, [6,0], :white, :w_pawn)
    self[6,1] = Pawn.new(self, [6,1], :white, :w_pawn)
    self[6,2] = Pawn.new(self, [6,2], :white, :w_pawn)
    self[6,3] = Pawn.new(self, [6,3], :white, :w_pawn)
    self[6,4] = Pawn.new(self, [6,4], :white, :w_pawn)
    self[6,5] = Pawn.new(self, [6,5], :white, :w_pawn)
    self[6,6] = Pawn.new(self, [6,6], :white, :w_pawn)
    self[6,7] = Pawn.new(self, [6,7], :white, :w_pawn)


    #and the black pieces
    self[0,0] = Rook.new(self, [0,0], :black, :b_rook)
    self[0,1] = Knight.new(self, [0,1], :black, :b_knight)
    self[0,2] = Bishop.new(self, [0,2], :black, :b_bishop)
    self[0,3] = Queen.new(self, [0,3], :black, :b_queen)
    self[0,4] = King.new(self, [0,4], :black, :b_king)
    self[0,5] = Bishop.new(self, [0,5], :black, :b_bishop)
    self[0,6] = Knight.new(self, [0,6], :black, :b_knight)
    self[0,7] = Rook.new(self, [0,7], :black, :b_rook)
    self[1,0] = Pawn.new(self, [1,0], :black, :b_pawn)
    self[1,1] = Pawn.new(self, [1,1], :black, :b_pawn)
    self[1,2] = Pawn.new(self, [1,2], :black, :b_pawn)
    self[1,3] = Pawn.new(self, [1,3], :black, :b_pawn)
    self[1,4] = Pawn.new(self, [1,4], :black, :b_pawn)
    self[1,5] = Pawn.new(self, [1,5], :black, :b_pawn)
    self[1,6] = Pawn.new(self, [1,6], :black, :b_pawn)
    self[1,7] = Pawn.new(self, [1,7], :black, :b_pawn)
  end

  def valid_move?(start_pos, end_pos)
    if self[*start_pos].possible_moves.include?(end_pos)
      return true if self[*end_pos].nil?
      return true if self[*end_pos].color != self[*start_pos].color
    end
    false
  end

end
