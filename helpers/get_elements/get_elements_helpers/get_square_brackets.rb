require_relative "order_by_syntax"

def get_square_brackets side

  open_bracket , close_bracket , open_close_bracket_hash = [] , [] , {} 

  for i in (0..side.length-1)
    if side[i] == "("
      open_bracket.push(i)     
    elsif side[i] == ")"
      close_bracket.push(i)
    end
  end

  bracket_status = open_bracket.count == close_bracket.count ? (open_bracket.count == 0 ? -2 : open_bracket.count) : -1

  if bracket_status > 0 
    open_close_bracket_hash = order_by_syntax(bracket_status,open_bracket,close_bracket,open_close_bracket_hash)
    open_bracket , close_bracket = open_close_bracket_hash.values , open_close_bracket_hash.keys  
  end  

  return bracket_status , open_bracket , close_bracket

end

