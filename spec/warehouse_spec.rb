require_relative "./../lib/warehouse"
require_relative "./../lib/product"

RSpec.describe Warehouse do 

let(:product) {Product.new("Chocolate", 12, 30)}
let(:product2) {Product.new("Cookies", 12, 30)}

  it "creates warehouse" do
    expect{
      Warehouse.new([product, product2])
      }.to_not raise_error
  end

  context "#show_all"
  it "shows products" do
    @warehouse=Warehouse.new([product, product2])
    expect(@warehouse.show_all).to
    eql("1 Chocolate 12$")
  end

  context "#find_product_by_id" 
    it "returns proper quantity value" do
      expect(Warehouse.new([product, product2])).find_product_by_id(1).
      to eql(product)
    end

end