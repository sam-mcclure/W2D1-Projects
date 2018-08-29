require 'singleton'
require_relative 'sliding_piece'
require_relative 'stepping_piece'

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
  
  def is_enemy?(pos)
    self.color != @board[pos].color
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
    @moves = find_diag_moves(@pos)
    @representation = " ♝ " if @color == :white
    @representation = " ♗ " if @color == :black
  end 
  
  def valid_moves
    @moves = find_diag_moves(@pos)
  end
end

class Rook < Piece
  include SlidingPiece
  
  def initialize(color, board, pos)
    super
    @moves = find_horiz_moves(@pos)
    @representation = " ♜ " if @color == :white
    @representation = " ♖ " if @color == :black
  end
  
  def valid_moves
    @moves = find_horiz_moves(@pos)
  end
    
  
end

class Queen < Piece 
  include SlidingPiece
  
  def initialize(color, board, pos)
    super
    @moves = find_diag_moves(@pos) + find_horiz_moves(@pos)
    @representation = " ♛ " if @color == :white
    @representation = " ♕ " if @color == :black
  end 
  
  def valid_moves
    @moves = find_diag_moves(@pos) + find_horiz_moves(@pos)
  end

end 

class Knight < Piece
  include SteppingPiece
  def initialize(color, board, pos)
    super
    @moves = find_knight_moves(@pos)
    @representation = " ♞ " if @color == :white
    @representation = " ♘ " if @color == :black
  end 
  
  def valid_moves
    @moves = find_knight_moves(@pos)
  end
end

class King < Piece
  include SteppingPiece
  def initialize(color, board, pos)
    super
    @moves = find_king_moves(@pos)
    @representation = " ♚ " if @color == :white
    @representation = " ♔ " if @color == :black
  end
  
  def valid_moves
    @moves = find_king_moves(@pos)
  end
end

class Pawn < Piece
  
end