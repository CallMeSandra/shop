
module Shop
  class Basket
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = quantity
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def total_price
      product = fetch_product
      product.price * quantity
    end
  end
end

=begin
class Basket
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(product)
    @basket << (product)
  end

  def search_basket_by_name(name)
    @basket.find do |product|
       product.name == name
    end
  end

  def delete(index)
    @basket.delete_at(index)
  end

  def count_basket
    value = @basket.map {|product| product.price}.
    reduce(0, :+)
    p "Yor basket value: #{value.round(2)}"
    p "With tax: #{(value*1.23).round(2)}"
  end


  def show
    puts "lp.  | name  | price"
    @basket.each_with_index do |x,index|
      puts " #{index+1} | #{x.name} | #{x.price}$"
    end
    puts " "
  end

end

=end
