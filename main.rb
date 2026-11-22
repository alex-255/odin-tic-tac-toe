class Board
  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def get_board
    @board
  end

  def add_mark(symbols, player)
    symbols = symbols.split('')
    row = symbols[1]
    column = symbols[0]
    row_index = case row
                when "A"
                  0
                when "B"
                  1
                when "C"
                  2
                end
    column_index = column.to_i - 1
    @board[row_index][column_index] = player.mark
  end

  def render_board
    puts '  1   2   3  '
    puts "A #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '  ---------'
    puts "B #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '  ---------'
    puts "C #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end
end

board = Board.new
board.render_board
