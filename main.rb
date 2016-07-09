require_relative 'helper/get_elements'

if ARGV[0] == "test"
  input = "Fe3O4 + H2O = FeOH + H2"
  ARGV.clear
else
  puts "Enter an equation  to be balanced : "
  input = gets.chomp
end

begin 
    reactants , products = input.split(" = ")
    reactants , products = reactants.gsub(" ","").split("+") , products.gsub(" ","").split("+")
    puts "Reactants : #{reactants}"
    puts "Products : #{products}"
    elements_reactants , elements_products = get_elements(reactants) , get_elements(products)
    puts "Elements in reactants : #{elements_reactants}"
    puts "Elements in products : #{elements_products}"
rescue Exception => e
    puts "Error rescued : #{e.to_s}"
end