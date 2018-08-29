require 'byebug'
require_relative 'piece.rb'
require_relative 'display.rb'

class Board
  attr_reader :rows
  
  def create_grid
    @rows = Array.new(8) { Array.new(8) }
    @rows.each_with_index do |row, row_idx|  
      row.each_index do |col_idx|
        # debugger
        if row_idx == 1
          self[[row_idx, col_idx]] = Pawn.new(:black, self, [row_idx, col_idx])
        elsif row_idx == 6
          self[[row_idx, col_idx]] = Pawn.new(:white, self, [row_idx, col_idx])
            
        
        else 
          # row_idx > 1 && row_idx < 6
          self[[row_idx, col_idx]] = @sentinel
        end
      end 
    end
    @rows
  end
  
  def initialize
    @sentinel = NullPiece.instance
    @rows = create_grid
  end
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ArgumentError, "No piece at start position" if self[start_pos] == @sentinel
    raise ArgumentError, "One of your pieces is already at that position" if self[end_pos].color == piece.color
    self[start_pos] = @sentinel
    self[end_pos] = piece
    piece.pos = end_pos
  end
  
  def add_piece(piece, pos)
    self[pos] = piece 
  end
  
  def [](pos)
    x, y = pos
    @rows[x][y]
  end
  
  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end
  
  def valid_pos?(pos)
    x,y = pos
    valid = (x >= 0 && x <= 7 && y >= 0 && y <= 7) 
    # raise ArgumentError, "The board doesn't contain that position" unless valid
    valid
  end
  
  def make_move
    d = Display.new(self)
    while true
      d.render
      d.cursor.get_input
    end
  end
  
  def is_occupied?(pos)
    self[pos] != @sentinel
  end
end