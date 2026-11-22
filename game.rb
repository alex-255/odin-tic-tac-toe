# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# The main class for the game.
class Game
  attr_reader :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new('Bob', '0')
    @player2 = Player.new('Alice', 'X')
    self.player1.present_self
    self.player2.present_self
  end

  def make_turn(player)
    puts "#{player.name}, make your choice(example, \"1A\"):"
    @board.add_mark(gets.chomp.upcase, player)
  end

  def the_winner_is(board)
    b = board.board
    if b[0][0] == '0' && b[0][1] == '0' && b[0][2] == '0' ||
      b[0][0] == '0' && b[1][0] == '0' && b[2][0] == '0' ||
      b[2][0] == '0' && b[2][1] == '0' && b[2][2] == '0' ||
      b[0][2] == '0' && b[1][2] == '0' && b[2][2] == '0' ||
      b[0][0] == '0' && b[1][1] == '0' && b[2][2] == '0' ||
      b[2][0] == '0' && b[1][1] == '0' && b[0][2] == '0'
      @player1
    elsif b[0][0] == 'X' && b[0][1] == 'X' && b[0][2] == 'X' ||
      b[0][0] == 'X' && b[1][0] == 'X' && b[2][0] == 'X' ||
      b[2][0] == 'X' && b[2][1] == 'X' && b[2][2] == 'X' ||
      b[0][2] == 'X' && b[1][2] == 'X' && b[2][2] == 'X' ||
      b[0][0] == 'X' && b[1][1] == 'X' && b[2][2] == 'X' ||
      b[2][0] == 'X' && b[1][1] == 'X' && b[0][2] == 'X'
      @player2
    else
      false
    end
  end

  def play(player1, player2)
    current_player = player1
    while self.the_winner_is(@board) == false
      if current_player == player1
        self.make_turn(player1)
        current_player = player2
      else
        self.make_turn(player2)
        current_player = player1
      end
      @board.render
    end
    puts "The winner is #{self.the_winner_is(@board).name}! Congratulations!"
  end
end

game = Game.new
game.board.render
game.play(game.player1, game.player2)
