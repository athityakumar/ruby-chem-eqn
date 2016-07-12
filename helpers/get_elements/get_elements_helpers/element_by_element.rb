def element_by_element side 

  hash ,left = {} , 0
  
  for i in (0..side.length-1)
    if side[i].to_i != 0   
      element , count =  side[left..i-1] , side[i].to_i  
      if element.length != 0 
        if !hash.include? element
          hash[element] = [] 
        end  
        hash[element].push([count,left,i-1])  
      end  
      left = i+1
    elsif i == side.length-1
      element , count = side[left..i] , 1
      if element.length != 0
        left = i+1
        if !hash.include? element
          hash[element] = []
        end
        hash[element].push([count,left,i])
      end  
    elsif side[i].downcase!.nil?  
      element , count = side[left..i] , side[i+1].to_i == 0 ? 1 : side[i+1].to_i 
      if element.length != 0
        left = i+1
        if !hash.include? element
          hash[element] = []
        end
        hash[element].push([count,left,i])   
      end  
    elsif side[i].upcase!.nil? && side[i+1].upcase!.nil? && side[i+1].to_i == 0
      element , count = side[i] , 1
      if element.length != 0
        left = i+1
        if !hash.include? element
          hash[element] = []
        end
        hash[element].push([count,i,i])   
      end
    end
  end
  
  return hash

end

