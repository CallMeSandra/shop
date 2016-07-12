module Shop
  class AddToBasket

    def initialize(params)
      @product_id = params.fetch("product_id").to_i#fetch wyrzuci błąd ZAMIAST NILa jeśli nie znajdzie czegoś takiego
      #to zabezpieczenie dla nas;
      @quantity = params.fetch("quantity").to_i

    end
    def call
      BASKET << Basket.new(
        product_id: @product_id,
        quantity: @quantity
        )

      #{product_id: product_id, quantity: quantity}
#teraz koszyk zawiera 2 informacje - id produktu i jego ilość
    end
  end
end
