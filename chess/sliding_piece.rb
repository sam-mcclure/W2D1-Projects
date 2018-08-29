require 'byebug'
module SlidingPiece

  def horiz_dirs
    HORIZ_DIRS
  end
  
  def diag_dirs
    DIAG_DIRS
  end
  
  def find_horiz_moves(pos)
    debugger
    pos_moves = []
    horiz_dirs.each do |dir|
      next_pos = [pos.first + dir.first, pos.last + dir.last]
      while @board.valid_pos?(next_pos) && !@board.is_occupied?(next_pos)
        pos_moves << next_pos
        next_pos = [next_pos.first + dir.first, next_pos.last + dir.last]
      end
      pos_moves << next_pos if @board.valid_pos?(next_pos) && is_enemy?(next_pos)
    end
    pos_moves
  end
  
  def find_diag_moves(pos)
    pos_moves = []
    diag_dirs.each do |dir|
      next_pos = [pos.first + dir.first, pos.last + dir.last]
      while @board.valid_pos?(next_pos) && !@board.is_occupied?(next_pos)
        pos_moves << next_pos
        next_pos = [next_pos.first + dir.first, next_pos.last + dir.last]
      end
      pos_moves << next_pos if is_enemy?(next_pos)
    end
    pos_moves
  end
    
  private
  HORIZ_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]].freeze
  DIAG_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]].freeze
  
end 