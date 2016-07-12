def beautify_element_by_element bracket_status , open_bracket , close_bracket , hash , side
  
  if bracket_status != -2
    for i in (0..bracket_status-1)
      k = close_bracket[i] == side.length-1 ? 0 : close_bracket[i]+1
      hash.each do |key,val|
        for j in (0..hash[key].count-1)
          if ((val[j][1] > open_bracket[i]) && (val[j][2] < close_bracket[i]) && (k!=0) && (side[k].to_i != 0)) 
            hash[key][j][0] = val[j][0] * side[k].to_i  
          end
        end  
      end 
    end
  end  
  hash.each do |key,val|
      for j in (0..hash[key].count-1)
        hash[key][j] = val[j][0]
      end
  end

  return hash

end
