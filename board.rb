# frozen_string_literal: true

# Class for operating the board of the game.
class Board
  attr_reader :board

  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def add_mark(symbols, player) # rubocop:disable Metrics/MethodLength
    symbols = symbols.split('')
    row = symbols[1]
    column = symbols[0]
    row_index = case row # rubocop:disable Style/HashLikeCase
                when 'A'
                  0
                when 'B'
                  1
                when 'C'
                  2
                end
    column_index = column.to_i - 1
    @board[row_index][column_index] = player.mark
  end

  def render_board # rubocop:disable Metrics/AbcSize
    puts '  1   2   3  '
    puts "A #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '  ---------'
    puts "B #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '  ---------'
    puts "C #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end
end
