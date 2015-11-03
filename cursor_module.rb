require 'io/console'
# stole from https://gist.github.com/acook/4190379

module Cursor
  # Reads keypresses from the user including 2 and 3 escape character sequences.
  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  # oringal case statement from:
  # http://www.alecjacobson.com/weblog/?p=75
  def show_single_key
    c = read_char

    case c
    # when " "
    #   puts "SPACE"
    # when "\r"
    #   puts "RETURN"
    # when "\e"
    #   puts "ESCAPE"
    when "\e[A"
      return "Up"
    when "\e[B"
      return "Down"
    when "\e[C"
      return "Right"
    when "\e[D"
      return "Left"
    # when "\177"
    #   puts "BACKSPACE"
    # when "\004"
    #   puts "DELETE"
    when "\u0003"
      puts "CONTROL-C"
      exit 0
    end
  end

  #show_single_key while(true)

end
