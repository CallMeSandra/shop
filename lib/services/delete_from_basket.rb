module Shop
  class DeleteFromBasket

    def initialize(param)
      @to_delete = param.fetch

    def call
      BASKET.delete(prm)
      item = BASKET.find do |basket|
        basket.product_id == @product_id
      end
      if item
        item.quantity += @quantity
      else
        BASKET << Basket.new(
          product_id: @product_id,
          quantity: @quantity
          )
    end
  end
end
