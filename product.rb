class Product
  attr_reader :name, :price , :id, :quantity
	
  @@id=0

  def initialize (price:, name:, quantity:) 
    @id = next_id
    @name = name
    @price = price 
    @quantity = quantity
  end



  private
  def next_id
    @@id += 1
  end
end


#product1 = Product.new({name: "Ball", price: 12.1, quantity: 10}) #dodać tutaj ilość?
#product2 = Product.new({name: "Pencil", price: 2.6, quantity: 100})
#product3 = Product.new({name: "Pen", price: 1.3, quantity: 100})
#product4 = Product.new({name: "Glue", price: 3.2, quantity: 3 })
#product5 = Product.new({name: "Book", price: 7.4, quantity: 15})

#p product1, product3, product5
#p product1.name
#p product1.id
# czy na tą chwilę ma znaczenie czy wyświetla mi się wszystko, czy może być "brzydko"?
# jak używać produktu $ wyszukać go po id
