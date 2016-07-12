=begin
class Shopp
  def initialize
    @warehouse = Warehouse.new([
      Product.new("Ball", 12.1),
      Product.new("Pencil", 2.6),
      Product.new("Pen", 1.3),
      Product.new("Glue", 3.2),
      Product.new("Book", 7.4)
      ])
    @basket = Basket.new
  end

  def star_shopping
  	@warehouse.show_all
  	p "Type number of thing you want to buy"
  	input = gets.chomp
  	choice = input.to_i
  	  if choice <=5
  	  	my = @warehouse.find_product_by_id(choice)
  	  	@basket.add(my)
  	  	puts "You bought #{my.name}"
	  else
		p "Wrong number-try again"
	  end
   end

  def remove_from_basket
   	puts @basket.show
   	puts "What do you want to remove? (give index)"
   	index = gets.chomp
   	  if index !=""
   	  	index = index.to_i - 1
   	  	product = @basket.basket[index]
   	  	  if product
   	  	  	@basket.delete(index)
   	  	  	puts "You removed #{product.name}"
		  else
			puts "Wrong index"
		  end
      end
  end

  def display_menu
  	loop do
	  puts "Select an operation number
	  1. Buy something
	  2. Check my basket
	  3. Remove product from basket
	  4. Check the final price
	  5. Exit"
	  action = gets.chomp

	  case action
	  when '1'
	  	star_shopping

	  when '2'
	    puts @basket.show

	  when '3'
	  	remove_from_basket

	  when '4'
	  	  @basket.count_basket
	  when '5'
		  break
	  else
	    puts "Wrong number - try again"
	  end
    end
  end

end

shop = Shopp.new
shop.display_menu

=end
