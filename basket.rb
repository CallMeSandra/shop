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

  def delete(index)
    @basket.delete_at(index)
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
    puts "lp.  | nazwa  | cena"
    @basket.each_with_index do |x,index|
      puts " #{index+1} | #{x.name} | #{x.price}$"
    end
    puts " "
  end

end

