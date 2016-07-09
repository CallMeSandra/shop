require_relative "./../warehouse"
require_relative "./../product"

RSpec.describe Warehouse do 
=begin
  before(:each) do
    @warehouse = Warehouse.new(Product.new("Ball", 12.1, 10),
    Product.new("Pencil", 2.6, 100))
  end
=end
let(:product) {Product.new("Chocolate", 12, 30)}
let(:product2) {Product.new("Cookies", 12, 30)}

  it "creates warehouse" do
    expect{
      Warehouse.new(product)
      }.to_not raise_error
  end

  it "shows products" do
    expect((Warehouse.new(product)).show_all).to
    eql("1 Chocolate 12$")
  end


end