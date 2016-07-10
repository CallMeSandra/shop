class Product
  attr_reader :name, :price , :id, :quantity
	
  @@id=0

  def initialize (name, price, quantity) 
    @id = next_id
    @name = set_name(name)
    @price = set_price(price) #set price
    @quantity = set_quantity(quantity)
  end

  private
  def next_id
    @@id += 1
  end

  def set_price(price) 
    raise ArgumentError unless price.is_a?(Numeric)
    raise ArgumentError if price <=0
    price
  end

  def set_name(name)
    raise ArgumentError if name.length < 2
    name
  end

  def set_quantity(quantity)
    raise ArgumentError unless quantity.is_a?(Numeric)
    raise ArgumentError if quantity <=0
    quantity
  end

end

