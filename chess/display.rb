require 'colorize'
require_relative 'cursor.rb'

class Display
  attr_accessor :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    system("clear")
    @board.rows.each_with_index do |row, idx|
      result = ""
      row.each_with_index do |square, square_idx|
        if @board[[idx, square_idx]].is_a?(NullPiece)
          square_occ = "   "
        else
          square_occ = @board[[idx, square_idx]].representation
        end
        
        if [idx, square_idx] == @cursor.cursor_pos
          square_occ = square_occ.colorize(:background => :blue)
        end
        result << square_occ
      end 
      puts result
    end
    nil
  end
  
end