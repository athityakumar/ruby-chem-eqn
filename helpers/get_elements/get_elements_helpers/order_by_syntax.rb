require_relative "get_index"

def order_by_syntax bracket_status , open_bracket , close_bracket , hash

  while open_bracket.count != 0 do
    key = close_bracket[0]
    index = get_index(open_bracket,key)
    value = open_bracket[index]
    hash[key] = value
    open_bracket.delete(value)
    close_bracket.delete(key)
  end

  return hash

end

