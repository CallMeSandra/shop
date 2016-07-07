require_relative "./product"
require_relative "./warehouse"

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

  def delete(product)
    @basket.delete(product)
  end

  def mapp
   @basket.map { |s| s.name }
  end

  def count_basket
  value = @basket.map {|s| s.price}.
  reduce(0, :+)
  p "Yor basket value: #{value}"
  p "With tax: #{(value*1.23).round(2)}"
  end


  def show
    @basket.each do |x|
      puts "#{x.name} #{x.price}$"
    end
    puts " "
  end

end

