require 'byebug'
require_relative 'piece.rb'

class Board
  
  def self.create_grid
    grid = Array.new(8) { Array.new(8) }
    # debugger
    grid.each_with_index do |row, row_idx|  
      row.each_index do |col_idx|
        if row_idx <= 1
          grid[row_idx][col_idx] = Piece.new(:black, self, [row_idx, col_idx])
        elsif row_idx >= 6
          grid[row_idx][col_idx] = Piece.new(:white, self, [row_idx, col_idx])
        else
          grid[row_idx][col_idx] = @sentinel
        end
      end 
    end
    grid
  end
  
  def initialize
    @sentinel = NullPiece.instance
    @rows = Board.create_grid
  end
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ArgumentError, "No piece at start position" if self[start_pos].nil?
    raise ArguementError, "That piece can't move there" if !!self[end_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    # piece.pos = end_pos
  end
  
  def [](pos)
    x, y = pos
    @rows[x][y]
  end
  
  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end
  
end