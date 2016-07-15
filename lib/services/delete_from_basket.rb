module Shop
  class DeleteFromBasket

    def initialize(params)
      @delete_index= params.fetch("index").to_i
    end

    def call
      BASKET.delete_at(@delete_index)
    end
  end
end
