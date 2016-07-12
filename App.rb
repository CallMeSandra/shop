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
      @products= FetchProduct.new.call
      erb :"products/product"
    end

    get "/product/:id" do
     @product = FetchProduct.new.call.find { |product| product.id == params[:id].to_i}
     erb :show
    end

    post "/basket" do
      AddToBasket.new(params).call
      redirect "/"
    end

    get "/basket" do
      #FetchBasket.new.call
      erb :basket_index
    end


    get "/form" do
      erb :form
    end

    post "/form_making" do #robimy formularz! nie dostaniemy sie do tego z przegladarki
      erb :hello
    end
  end
end

