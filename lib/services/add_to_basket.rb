module Shop
  class AddToBasket

    def initialize(params_but_diffrent)
      @product_id = params_but_diffrent.fetch("product_id").to_i
      @quantity = params_but_diffrent.fetch("quantity").to_i
    end

    def call
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
    end
  end
end
