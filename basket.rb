require_relative "./product"
require_relative "./warehouse"

class Basket
attr_reader :basket

  def initialize 
    @basket = []
  end 

  def count_basket
	@value = @basket.map {|s| s[:price]}.
	reduce(0, :+)
  end

  def count_with_vat
   (@value.to_f*1.23).round(2) [CZY ZAŁAPIE @VALUE?]
  end

  def show_basket
	basket_input = @basket.map { |s| " #{s[:name]} #{s[:price]}" }
  end

  def add(product) [DO TEGO POTRZEBUJĘ WYŚWIETLANIA ID;JAK DODAĆ PRODUKT PO ID?]
  	#tak jak w hashu przez [:id]
  	@basket << product
  end

end
