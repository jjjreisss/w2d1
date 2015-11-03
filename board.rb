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
    raise ArgumentError.new "No piece there" unless self[*start_pos]
    # raise ArgumentError.new "Invalid move" unless valid_move?[]
    self[*start_pos].nil?
    self[*end_pos] = self[*start_pos]
    self[*start_pos] = nil
  end

  # def valid_move?
  # end

end
