def get_elements sides

  sides_hash = {}
  sides.each do |side|
    sides_hash[side] = {}
    left = 0
    for i in (0..side.length-1)
      if side[i].to_i != 0   
        element , count =  side[left..i-1] , side[i].to_i 
        if element.length != 0 
          sides_hash[side][element] = count 
        end  
        left = i+1
      elsif i == side.length-1
        element , count = side[left..i] , 1
        if element.length != 0
          sides_hash[side][element] , left = count , i+1
        end  
      elsif side[i].downcase!.nil?  
        element , count = side[left..i] , side[i+1].to_i == 0 ? 1 : side[i+1].to_i 
        if element.length != 0
          sides_hash[side][element] , left = count , i+1
        end  
      elsif side[i].upcase!.nil? && side[i+1].upcase!.nil? && side[i+1].to_i == 0
        element , count = side[i] , 1
        if element.length != 0
          sides_hash[side][element] , left = count , i+1
        end  
      end
    end
  end

  return sides_hash

end  
