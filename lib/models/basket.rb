module Shop
  class Basket
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = set_quantity(quantity)
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def total_price
      product = fetch_product
      product.price * quantity.round(2)
    end

    def price_with_tax
      total_price*1.23.round(2)
    end

    private
    def set_quantity(quantity)
      raise ArgumentError unless quantity.is_a?(Numeric)
      raise ArgumentError if quantity <=0
      quantity
    end
  end
end
