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

  #def products(products) - to samo co :products
  #	@products = products
  #end

  def find_product_by_id(my_id)
  	@products.find do |product| 
  	   product.id == my_id
  	end
  end  	

 # def find_product(list)
  #	puts "Select product number"
#	#choice = gets.chomp
#	id = (choice.to_i)
 #   list.each do |x|
  #  	if x.id == id
   # 		#puts "#{x.id} #{x.name} #{x.price}$"
    #		puts x
#    	else
 #   	    nil
  #  	end
   # end
 # end


end

#product1 = Product.new({name: "Ball", price: 12.1, quantity: 10}) #dodać tutaj ilość?
#product2 = Product.new({name: "Pencil", price: 2.6, quantity: 100})
#product3 = Product.new({name: "Pen", price: 1.3, quantity: 100})
#product4 = Product.new({name: "Glue", price: 3.2, quantity: 3 })
#product5 = Product.new({name: "Book", price: 7.4, quantity: 15})

#products_list = [product1, product2, product3, product4, product5]

#warehouse = Warehouse.new(products_list)
#warehouse.products #daje to samo, co products_list

#my = warehouse.find_product_by_id(3)
#puts my
#p product3
#warehouse.show_all(products_list)

#warehouse.find_product(products_list)

