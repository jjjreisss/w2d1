require_relative 'display'
require_relative 'cursor_module'
require_relative 'errors'

class Game

  attr_reader :display, :start_pos, :end_pos, :board

  def initialize(display, board)
    @display = display
    @board = board
  end

  def get_move
    start_pos = nil
    end_pos = nil
      # all Display#move_cursor cases except "Return" return nil,
      # while case "Return" returns a truthy value @cursor_pos, so once
      # display.move_cursor isn't nil, we know that user has pressed
      # return key
    while start_pos.nil?
      display.render
      puts "Choose your start position:"
      start_pos = display.move_cursor
    end
    # to accomodate continual change of display.move_cursor value
    # after start_pos has been assigned in the previous loop
    start_pos = start_pos.dup

    while end_pos.nil?
      display.render
      puts "Choose your end position:"
      end_pos = display.move_cursor
    end

    [start_pos, end_pos]
  end

  def make_move
    board.move(*get_move)
  rescue BlankSpaceError => e
    puts "There's no piece to move here!"
  end

  def play
    while true
      make_move
    end
  end
end
