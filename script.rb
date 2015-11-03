load 'bishop.rb'
load 'board.rb'
load 'cursor_module.rb'
load 'display.rb'
load 'game.rb'
load 'inheritence.rb'
load 'king.rb'
load 'knight.rb'
load 'pawn.rb'
load 'piece.rb'
load 'queen.rb'
load 'rook.rb'
load 'sliding_piece.rb'
load 'stepping_piece.rb'
board = Board.new
board.populate


display = Display.new(board)
game = Game.new(display, board)
game.play
display.render
