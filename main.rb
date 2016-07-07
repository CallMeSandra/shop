require_relative "./product"
require_relative "./warehouse"
require_relative "./basket"

product1 = Product.new({name: "Ball", price: 12.1, quantity: 10}) #dodać tutaj ilość?
product2 = Product.new({name: "Pencil", price: 2.6, quantity: 100})
product3 = Product.new({name: "Pen", price: 1.3, quantity: 100})
product4 = Product.new({name: "Glue", price: 3.2, quantity: 3 })
product5 = Product.new({name: "Book", price: 7.4, quantity: 15})

products_list = [product1, product2, product3, product4, product5]

@warehouse = Warehouse.new(products_list)

#my = warehouse.find_product_by_id(3)
#puts my
#puts my.name
@basket = Basket.new


def menu
	puts "Select an operation number
	1. Buy something
	2. Check my basket
	3. Remove product from basket
	4. Check the final price"
	action = gets.chomp
	case action
	when '1'
	  @warehouse.show_all
	  p "Type number of thing you want to buy"
	  input = gets.chomp
	  choice = input.to_i
	  if choice <=5
	  	my = @warehouse.find_product_by_id(choice)
	  	@basket.add(my)
	  	puts "You bought #{my.name}"
	  menu
	 else 
		p "Wrong number-try again"
		menu
	end
	when '2'
	  puts @basket.show
	  menu
	when '3'
	  puts @basket.show
	  puts "What do you want to remove? (give name)"
	  given_name = gets.chomp
	  new_basket = @basket.mapp { |s| s.name}
	  if new_basket.include?(given_name)
	  	ed = @basket.search_basket_by_name(given_name)
	  	@basket.delete(ed)
	  	puts "You removed #{ed.name}"
	  	menu
	  else
	  	puts "Wrong name"
	  menu
	 end
	when '4'
		@basket.count_basket
		menu
	else
	  puts "Wrong number - try again"
	  menu
	end
end
puts menu