require_relative "./product"
require_relative "./warehouse"

class Basket
attr_reader :basket

  def initialize 
    @basket = []
  end 

  def add(product)
    @basket<<(product)
  end

  def delete(product)
    @basket.delete(product)
  end

  def show
    @basket.each do |x|
      puts "#{x.name} #{x.price}$"
    end
    puts " "
  end

 # def count_basket
#	@@value = @basket.map {|s| s[:price]}.
#	reduce(0, :+)
 # end

  #def count_with_vat
   #(@@value.to_f*1.23).round(2)
  #end


end

#warehouse.show_all(products_list)
=begin
p '1'
basket=Basket.new
basket.add("milk")
basket.add("grapes")
basket.add("weed")
p basket
basket.delete("weed")
p basket
=end

#warehouse.show_all(products_list)

