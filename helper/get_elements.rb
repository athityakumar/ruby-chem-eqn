def get_square_brackets side
  open_bracket , close_bracket = [] , []
  for i in (0..side.length-1)
    if side[i] == "("
      open_bracket.push(i)     
    elsif side[i] == ")"
      close_bracket.push(i)
    end
  end
  bracket_status = open_bracket.count == close_bracket.count ? (open_bracket.count == 0 ? -2 : open_bracket.count) : -1
  return bracket_status , open_bracket , close_bracket
end

def delete_elements hash , elements_to_delete
  elements_to_delete.each do |element_to_delete|
    hash.delete(element_to_delete)
  end
  return hash
end

def element_by_element side 
  hash ,left = {} , 0
  for i in (0..side.length-1)
    if side[i].to_i != 0   
      element , count =  side[left..i-1] , side[i].to_i  
      if element.length != 0 
        hash[element] = [count,left,i-1] 
      end  
      left = i+1
    elsif i == side.length-1
      element , count = side[left..i] , 1
      if element.length != 0
        hash[element] , left = [count,left,i] , i+1
      end  
    elsif side[i].downcase!.nil?  
      element , count = side[left..i] , side[i+1].to_i == 0 ? 1 : side[i+1].to_i 
      if element.length != 0
        hash[element] , left = [count,left,i] , i+1
      end  
    elsif side[i].upcase!.nil? && side[i+1].upcase!.nil? && side[i+1].to_i == 0
      element , count = side[i] , 1
      if element.length != 0
        hash[element] , left = [count,i,i] , i+1
      end
    end
  end
  return hash
end

def beautify_element_by_element bracket_status , open_bracket , close_bracket , hash , side
  if bracket_status != -2
    for i in (0..bracket_status-1)
      k = close_bracket[i] == side.length-1 ? 0 : close_bracket[i]+1
      hash.each do |key,val|
        if (val[1] > open_bracket[i]) && (val[2] < close_bracket[i]) && (k!=0) && (side[k].to_i != 0) 
          hash[key] = val[0] * side[k].to_i 
        else
          hash[key] = val[0]
        end  
      end 
    end
  else
    hash.each do |key,val|
      hash[key] = val[0]
    end
  end  
  return hash
end

def get_elements sides

  sides_hash = {}
  sides.each do |side|
    sides_hash[side] = {}
    bracket_status , open_bracket , close_bracket = get_square_brackets(side)
    if bracket_status == -1
      puts "Invalid equation syntax"
    else
      sides_hash[side] = element_by_element(side) 
      if bracket_status !=- 2
        sides_hash[side] = delete_elements(sides_hash[side],["(",")"])
      end
      sides_hash[side] = beautify_element_by_element(bracket_status,open_bracket,close_bracket,sides_hash[side],side)        
    end
  end

  return sides_hash

end  
