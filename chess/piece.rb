require 'singleton'

class Piece
  attr_reader :color
  attr_writer :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def inspect
    "Type of Piece #{self.class} Color #{@color} Pos #{@pos}"
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :grey
    @pos = nil
  end
end