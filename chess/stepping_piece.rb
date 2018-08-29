module SteppingPiece

  def find_king_moves(pos)
    pos_moves = []
    king_diffs.each do |dir|
      next_pos = [pos.first + dir.first, pos.last + dir.last]
      pos_moves << next_pos if @board.valid_pos?(next_pos) && !@board.is_occupied?(next_pos)
      pos_moves << next_pos if is_enemy?(next_pos)
    end
    pos_moves
  end
  
  def find_knight_moves(pos)
    pos_moves = []
    knight_diffs.each do |dir|
      next_pos = [pos.first + dir.first, pos.last + dir.last]
      pos_moves << next_pos if @board.valid_pos?(next_pos) && !@board.is_occupied?(next_pos)
      pos_moves << next_pos if is_enemy?(next_pos)
    end
    pos_moves
  end
  
  
  def king_diffs
    KING_DIFFS
  end
  
  def knight_diffs
    KNIGHT_DIFFS
  end
  
  private
  KING_DIFFS = [[0, -1], [0, 1], [-1, 0], [1, 0],[1, 1], [1, -1], [-1, -1], [-1, 1]].freeze
  KNIGHT_DIFFS = [[2, 1], [2, -1], [-2, -1], [1, 2], [-1, -2], [1, -2], [-1, 2]].freeze
end