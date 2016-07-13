module Shop
  class AddToBasket

    def initialize(params_but_diffrent)
      @product_id = params_but_diffrent.fetch("product_id").to_i#fetch wyrzuci błąd ZAMIAST NILa jeśli nie znajdzie czegoś takiego
      #to zabezpieczenie dla nas;
      @quantity = params_but_diffrent.fetch("quantity").to_i
    end

    def call
      # szukam w Basket tego ID, jeśli jest
      # quantity += quantity
      #unless quantity < 0
      item = BASKET.find do |basket|
        basket.product_id == @product_id
      end
      if item
        if @quantity > 0
          item.quantity += @quantity
        else
          raise ArgumentError
        end
      else
        BASKET << Basket.new(
          product_id: @product_id,
          quantity: @quantity
          )
      end
      #else
       # raise ArgumentError
      #end
    end
  end
end
      #{product_id: product_id, quantity: quantity}
#teraz koszyk zawiera 2 informacje - id produktu i jego ilość
