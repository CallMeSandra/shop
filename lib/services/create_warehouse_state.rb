module Shop
  class CreateWarehouseState
    def call(product_id, quantity)
      WAREHOUSE << WarehouseState.new(product_id, quantity)
    end
  end
end
