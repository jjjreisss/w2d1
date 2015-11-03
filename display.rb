require_relative 'board.rb'
require 'colorize'
require 'io/console'
require_relative 'cursor_module'

class Display

  include Cursor

  def initialize(board)
    @cursor_pos = [0, 0]
    @board = board
  end

  def render
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
          board[i][j].colorize(:background => :white) if (i+j).even?
      end
    end
  end

  def highlight_cursor(board)
    board[@cursor_pos[0]][@cursor_pos[1]] =
      board[@cursor_pos[0]][@cursor_pos[1]].colorize(:background => :green)
    board
  end

  def place_pieces(board)
    board = @board.map do |row|
      row.map do |tile|
        # later, refactor to ': tile.value' or whatever
        tile.nil? ? "  " : tile
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
      @cursor_pos[0] -= 1
      puts "Moved up 1 space"
    when "Down"
      @cursor_pos[0] += 1
      puts "Moved down 1 space"
    when "Right"
      @cursor_pos[1] += 1
      puts "Moved right 1 space"
    when "Left"
      @cursor_pos[1] -= 1
      puts "Moved left 1 space"
    end
  end

end
