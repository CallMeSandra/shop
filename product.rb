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

