require 'singleton'

class Piece
  attr_reader :color
  attr_writer :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :grey
    @board = nil
    @pos = nil
  end
end