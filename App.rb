require "bundler/setup"
require "sinatra/base"
Dir["./lib/**/*.rb"].each{|file| require file}


module Shop

  PRODUCTS = [
    Product.new("Coffe",20),
    Product.new("Tea",30),
    Product.new("Chocolate",12),
    Product.new("Cookies",50),
    Product.new("Fireworks",300)
  ]

  WAREHOUSE = [
    WarehouseState.new(1, 500),
    WarehouseState.new(2, 200),
    WarehouseState.new(3, 600),
    WarehouseState.new(4, 400),
    WarehouseState.new(5, 300)
  ]

  BASKET = []

  class App<Sinatra::Base

    get "/" do
      @products= FetchProducts.new.call
      erb :"products/product"
    end

    get "/product/:id" do |id|
          # @product = FetchProducts.new.call.find { |product| product.id == params[:id].to_i}
          @product = FetchProduct.new.call(id)
          halt 404 unless @product
          erb :show
    end

    post "/basket" do
      begin
      AddToBasket.new(params).call #tutaj łapie że params są zastrzeżoną nazwą, tymi przesłanymi
      redirect "/"
        rescue ArgumentError
          #halt 404
          redirect "/basket"
        end
    end

    get "/basket" do
      products_in_basket = FetchBasket.new.call
      count_price = products_in_basket.map{|x| x[:total_price]}.reduce(:+)
      count_with_tax = products_in_basket.map{|x| x[:tax]}.reduce(:+)
      erb :basket_index, locals: { basket: products_in_basket, total: count_price, tax: count_with_tax}
    end

    post "/fake_removing_page" do
      DeleteFromBasket.new(params).call
      redirect "/basket"
    end


    get "/form" do
      erb :form
    end

    post "/form_making" do #robimy formularz! nie dostaniemy sie do tego z przegladarki
      erb :hello
    end
  end
end

