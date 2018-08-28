require 'singleton'
require_relative 'sliding_piece'

class Piece
  attr_reader :color, :representation, :moves
  attr_writer :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @moves = []
    
    @representation = " ♟ " if @color == :white
    @representation = " ♙ " if @color == :black
  end
  
  def inspect
    "Type of Piece #{self.class} Color #{@color} Pos #{@pos}"
  end
  
  def valid_moves
    
  end 
end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :grey
    @pos = nil
  end

end

class Bishop < Piece
  include SlidingPiece
  
  def initialize(color, board, pos)
    super
    @moves = diagonal_slides(pos)
  end 
end

class Rook < Piece
  include SlidingPiece
  
  def initialize(color, board, pos)
    super
    @moves = horizontal_slides(@pos)
  end
  
  def valid_moves
    @moves = horizontal_slides(@pos)
  end
    
  
end