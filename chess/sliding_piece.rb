module SlidingPiece
  
  def horizontal_slides(pos)
    result = []
    x, y = pos
    
    plus_idx = 1
    while y + plus_idx <= 7
      result << [x,y + plus_idx]
      plus_idx += 1
    end 
    
    minus_idx = 1
    while y - minus_idx >= 0
      result << [x,y - minus_idx]
      minus_idx += 1 
    end 
    
    plus_idx = 1
    while x + plus_idx <= 7
      result << [x + plus_idx, y]
      plus_idx += 1
    end 
    
    minus_idx = 1
    while x - minus_idx >= 0
      result << [x - minus_idx ,y]
      minus_idx += 1 
    end 
    
    result
  end 
  
  def diagonal_sliding_moves(pos)
    x,y = pos
  end 
  
end 