require_relative "./../lib/models/basketitem"
require_relative "./../lib/models/product"

RSpec.describe basketitem do
 # before(:each) do
  #  @basket = BasketItem.new
  #end
  let(:product_id) {1}
  let(:quantity) {15}


  it "creates empty basket" do
    expect{
      BasketItem.new(product_id, quantity)
      }.to_not raise_error
    end
  end
=begin
  it "adds product" do
    @basket.add("monkey")
    expect(@basket.basket).to eql (["monkey"])
  end

  it "removes product" do
  	products_array = ["monkey", "cucumber", "tortilla"]
  	fulfill_basket(products_array)
  	@basket.delete(0)
  	expect(@basket.basket.size).to eql(2)
  	expect(@basket.basket).to_not eql(products_array)
   end

   it "also removes products" do
   	products_array = ["monkey", "cucumber", "tortilla"]
  	products_array.delete_at(0)
  	basket_array = products_array
  	fulfill_basket(products_array)
  	expect(@basket.basket).to eql(basket_array)
   end

  def fulfill_basket(products_array)
  	products_array.each do |product|
  	  @basket.add(product)
  	end
  end

=end


