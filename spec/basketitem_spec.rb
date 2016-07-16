require_relative "./../lib/models/basketitem"
require_relative "../lib/services/fetchproduct"

RSpec.describe Shop::BasketItem do
  let (:id) {1}
  let (:quantity) {4}
  let (:price) {20}


  it "creates empty basket" do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: quantity)
      }.to_not raise_error
    end

  it "raises error for 0 quantity" do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: 0)
      }.to raise_error ArgumentError
  end

  it "raises error for string quantity" do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: "five")
      }.to raise_error ArgumentError
  end

  it "raises error for char quantity" do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: 'f')
      }.to raise_error ArgumentError
  end

  it "raises error for quantity < 0 " do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: -10)
      }.to raise_error ArgumentError
  end

  it "raises error for float quantity " do
    expect{
      Shop::BasketItem.new(product_id: id, quantity: 1.324)
      }.to raise_error ArgumentError
  end

  it "calls fetchProduct with given id" do
      expect(Shop::FetchProduct).to receive_message_chain(:new, :call).with(id)

      Shop::BasketItem.new(product_id: id, quantity: quantity).fetch_product
  end

  it "counts price" do
    product = double(price: price) #double udaje to czego poterzbujemy
    expect(Shop::FetchProduct).to receive_message_chain(:new, :call).
    with(id).and_return(product)
    expect(Shop::BasketItem.new(product_id: id, quantity: quantity).total_price).to eql(80.0)
  end

  it "counts price with tax" do
    product = double(price: price)
    expect(Shop::FetchProduct).to receive_message_chain(:new, :call).
    with(id).and_return(product)
    expect(Shop::BasketItem.new(product_id: id, quantity: quantity).price_with_tax).to eql(98.4)
  end
end


#mamy metodę główną. jeśli w środku wywołujemy jakąś metodę, nie wołamy jej w testach (lvl wyżej)
#drugi raz, bo one WIEDZĄ że mają "znaleźć siebie same"; metody wołamy na obiekcie, a nie
#jedna na drugiej
