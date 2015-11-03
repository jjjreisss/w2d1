require_relative 'display'
require_relative 'cursor_module'

class Game

  attr_reader :display, :start_pos, :end_pos

  def initialize(display)
    @display = display
  end

  def get_move
    display.render
    start_pos = nil
    end_pos = nil

      # all Display#move_cursor cases except "Return" return nil,
      # while case "Return" returns a truthy value @cursor_pos, so once
      # display.move_cursor isn't nil, we know that user has pressed
      # return key
    while start_pos.nil?
      display.render
      start_pos = display.move_cursor
      display.render
    end

    # to accomodate continual change of display.move_cursor value
    # after start_pos has been assigned in the previous loop
    start_pos = start_pos.dup

    while end_pos.nil?
      display.render
      end_pos = display.move_cursor
      display.render
    end

    [start_pos, end_pos]
  end
end
