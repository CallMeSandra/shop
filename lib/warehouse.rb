require_relative "./product"

class Warehouse
  attr_reader :products, :id, :list

  def initialize(products)
     @products = products
  end
  
  def show_all
  	@products.each do |x|
  	  puts "#{x.id} #{x.name} #{x.price}$"
  	end
  end

  def find_product_by_id(my_id)
  	@products.find do |product| 
  	   product.id == my_id
  	end
  end  	
end