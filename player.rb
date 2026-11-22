# frozen_string_literal: true

# The class for operating with player of the game.
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def present_self
    puts "The first player is #{self.name} with mark \"#{self.mark}\"."
  end
end
