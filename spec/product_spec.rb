require_relative "./../lib/models/product"

RSpec.describe Shop::Product do
  let (:price) {12.11}
  let (:name) {"chocolate"}
  let (:image) {"img_url"}

  it "raises error for invalid number of arguments" do
  expect{
    Shop::Product.new(name, image)
    }.to raise_error ArgumentError
  end

  it "creates product" do
    expect{
      Shop::Product.new(name, price, image)
      }.to_not raise_error
	end

  it "raises error for price = 0" do
  expect{
    Shop::Product.new(name, 0, image)
    }.to raise_error ArgumentError
  end

  it "raises error for price < 0" do
  expect{
    Shop::Product.new(name, -10, image)
    }.to raise_error ArgumentError
  end

  it "raises error for name shorter than 3 chars" do
  expect{
    Shop::Product.new("sn", price, image)
    }.to raise_error ArgumentError
  end

  it "raises error for name == nil" do
  expect{
    Shop::Product.new(nil, price, image)
    }.to raise_error ArgumentError
  end
end
