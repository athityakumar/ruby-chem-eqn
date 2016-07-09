def get_reactants_products input

  return input.split(" = ")[0].gsub(" ","").split("+") , input.split(" = ")[1].gsub(" ","").split("+")

end  
