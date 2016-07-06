require_relative "./product"

class Warehouse
  attr_reader :products

  def initialize(products)
    @products = products
  end

  #def find(id)
  	#arr.any?{|a| a.seat_id == "value"}

    
  #end

end

product1 = Product.new({name: "Ball", price: 12.1, quantity: 10}) #dodać tutaj ilość?
product2 = Product.new({name: "Pencil", price: 2.6, quantity: 100})
product3 = Product.new({name: "Pen", price: 1.3, quantity: 100})
product4 = Product.new({name: "Glue", price: 3.2, quantity: 3 })
product5 = Product.new({name: "Book", price: 7.4, quantity: 15})

p "yolo"

products_list = [product1, product2, product3, product4, product5]


warehouse = Warehouse.new(products_list)
p warehouse.products

p "I have no idea what i'm doing"

p products_list.find {|a| a.product.id == "2"}

