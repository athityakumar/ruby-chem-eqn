require_relative 'helper/get_elements'
require_relative 'helper/get_reactants_products'

if ARGV[0] == "testing"
  input = "Fe3O4 + H2O = FeOH + H2"
  ARGV.clear
else 
  if ARGV.count != 0 
    ARGV.clear
  end
  puts "Enter an equation  to be balanced : "
  input = gets.chomp
end

begin 
    reactants , products = get_reactants_products(input)
    puts "Reactants : #{reactants}"
    puts "Products : #{products}"
    elements_reactants , elements_products = get_elements(reactants) , get_elements(products)
    puts "Elements in reactants : #{elements_reactants}"
    puts "Elements in products : #{elements_products}"
rescue Exception => e
    puts "Error rescued : #{e.to_s}"
end