module Shop
  class FetchBasket

    def call

      BASKET.map do |each_product|
        {
          product: each_product.fetch_product,
          product_id: each_product.product_id,
          quantity: each_product.quantity,
          total_price: each_product.total_price
        }
end
    end
  end
end
