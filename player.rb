# frozen_string_literal: true

# The class for operating with player of the game.
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def present_self
    puts "#{self.name} plays with mark \"#{self.mark}\"."
  end
end
