module Shop
  class FetchBasket

    def call
=begin
      BASKET.map do |each_product|
        {
          product: each_product.product_idd,
          quantity: each_product.quantityd,
        }
=end
      end
    end
  end


