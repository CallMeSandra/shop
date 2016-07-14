require "bundler/setup"
require "sinatra/base"
Dir["./lib/**/*.rb"].each{|file| require file}

module Shop

  PRODUCTS = [
    Product.new("Pikachu",8200, "http://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png"),
    Product.new("Bulbasaur",3000, "http://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
    Product.new("Squirle",3900, "http://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png"),
    Product.new("Jigglypuff",2400, "http://assets.pokemon.com/assets/cms2/img/pokedex/full/039.png"),
    Product.new("Snorlax",5800, "http://assets.pokemon.com/assets/cms2/img/pokedex/full/143.png")
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
    configure :test do
      set :dump_errors, false
    end

    get "/" do
      products= FetchProducts.new.call
      erb :"products/index", locals: { products: products }
    end

    get "/product/:id" do |id|
      product = FetchProduct.new.call(id)
      if product
        erb :"products/show", locals: { product: product }
      else
        redirect "/404"
      end
    end

    post "/basket" do
      begin
        AddToBasket.new(params).call
        redirect "/"
      rescue ArgumentError
        redirect "/404"
      end
    end

    get "/basket" do
      products_in_basket = FetchBasket.new.call
      count_price = products_in_basket.map{|x| x[:total_price]}.reduce(:+)
      count_with_tax = products_in_basket.map{|x| x[:tax]}.reduce(:+)
      erb :"basket/index",
      locals: { basket: products_in_basket, total: count_price, tax: count_with_tax }
    end

    post "/fake_removing_page" do
      DeleteFromBasket.new(params).call
      redirect "/basket"
    end

    get "/404" do
      status 404
      erb :"404", layout: nil
    end

    not_found do
      status 404
      erb :"404", layout: nil
    end
  end
end
