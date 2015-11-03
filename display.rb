require_relative 'board.rb'
require 'colorize'
require 'io/console'
require_relative 'cursor_module'

CHESS_PIECES = {
  :w_queen => " ♛ ".colorize(:white),
  :w_king => " ♚ ".colorize(:white),
  :w_rook => " ♜ ".colorize(:white),
  :w_bishop => " ♝ ".colorize(:white),
  :w_knight => " ♞ ".colorize(:white),
  :w_pawn => " ♟ ".colorize(:white),
  :b_queen => " ♛ ".colorize(:black),
  :b_king => " ♚ ".colorize(:black),
  :b_rook => " ♜ ".colorize(:black),
  :b_bishop => " ♝ ".colorize(:black),
  :b_knight => " ♞ ".colorize(:black),
  :b_pawn => " ♟ ".colorize(:black)
}


class Display

  attr_reader :cursor_pos

  include Cursor

  def initialize(board)
    @cursor_pos = [0, 0]
    @board = board
  end

  def render
    system("clear")
    colorized_board = place_pieces(@board)
    colorized_board = checkerize(colorized_board)
    colorized_board = highlight_cursor(colorized_board)

    colorized_board.each do |row|
      puts row.join("")
    end
  end

  def checkerize(board)
    board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        board[i][j] =
          board[i][j].colorize(:background => :magenta) if (i+j).even?
        board[i][j] =
          board[i][j].colorize(:background => :light_cyan) if (i+j).odd?
      end
    end
  end

  def highlight_cursor(board)
    board[@cursor_pos[0]][@cursor_pos[1]] =
      board[@cursor_pos[0]][@cursor_pos[1]].colorize(:background => :green)
    board
  end

  def place_pieces(board)
    board = @board.grid.map do |row|
      row.map do |tile|
        # later, refactor to ': tile.value' or whatever
        tile.nil? ? "   " : CHESS_PIECES[tile.piece_type]
      end
    end
    board
  end

  def move_cursor
    breakout = true
    while breakout
      direction = show_single_key
      breakout = false
    end

    case direction
    when "Up"
      @cursor_pos[0] -= 1 if @cursor_pos[0].between?(1, 7)
      nil
    when "Down"
      @cursor_pos[0] += 1 if @cursor_pos[0].between?(0, 6)
      nil
    when "Right"
      @cursor_pos[1] += 1 if @cursor_pos[1].between?(0, 6)
      nil
    when "Left"
      @cursor_pos[1] -= 1 if @cursor_pos[1].between?(1, 7)
      nil
    when "Return"
     @cursor_pos
    end
  end

end
