module Shop
  class Product
    attr_reader :name, :price , :id, :quantity, :image_url

    @@id=0

    def initialize (name, price, image_url)
      @id = next_id
      @name = set_name(name)
      @price = set_price(price)
      @image_url = image_url
    end

    private
    def next_id
      @@id += 1
    end

    def set_price(price)
      raise ArgumentError unless price.is_a?(Numeric)
      raise ArgumentError if price <=0
      price
    end

    def set_name(name)
      if name == nil or name.length < 3
        raise ArgumentError
      else
        name
      end
    end
  end
end
