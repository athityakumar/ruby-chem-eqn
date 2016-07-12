require_relative "get_elements_helpers/get_square_brackets"
require_relative "get_elements_helpers/beautify_element_by_element"
require_relative "get_elements_helpers/delete_elements"
require_relative "get_elements_helpers/element_by_element"

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
