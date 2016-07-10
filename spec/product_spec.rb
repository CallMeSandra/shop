require_relative "./../lib/product"

RSpec.describe Product do 
  let (:price) {12.11} #definiuje
  let (:name) {"chocolate"}
  let (:quantity) {100}
	
  it "creates product" do
    expect{
      Product.new(name, price, quantity)
      }.to_not raise_error
	end

    it "raises error for invalid number of arguments" do
    expect{
      Product.new(nil)
      }.to raise_error(ArgumentError)
  end

  context "#name" 
    it "returns proper name value" do
      expect(Product.new("foo",2, quantity).name).
      to eql("foo")
    end

  context "#price" 
    it "returns proper price value" do
      expect(Product.new("foo",24, 8).price).
      to eql(24)
    end

  context "#quantity" 
    it "returns proper quantity value" do
      expect(Product.new("foo",24, 230).quantity).
      to eql(230)
    end

  it "raises error for invalid price" do
    expect{
      Product.new(name,nil,quantity).price
    }.to raise_error(ArgumentError)
  end

  it "raises error for price < 0" do
    expect{
      Product.new(name,-10,quantity).price
    }.to raise_error(ArgumentError)
  end

  it "raises error for name shorter than 2 letters" do
    expect{
      Product.new("s",price,quantity)
    }.to raise_error(ArgumentError)
  end

  it "raises error for invalid quantity" do
    expect{
      Product.new(name,price,nil)
    }.to raise_error(ArgumentError)
  end
end