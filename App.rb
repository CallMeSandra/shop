require "sinatra/base"

require_relative "lib/product"
require_relative "lib/product_please_work"


module Shop

  PRODUCTS = [
    Product.new("coffe",20),
    Product.new("tea",30)
  ]

  class App<Sinatra::Base


    get "/" do
      "Hello World"
    end

    get "/product" do
      @products= Product_please_work.new.call
      erb :product
    end

    get "/product/:id" do
     @product = Product_please_work.new.call.find { |product| product.id == params[:id].to_i}
     erb :show
    end

    get "/form" do
      erb :form
    end

    post "/form_making" do #robimy formularz! nie dostaniemy sie do tego z przegladarki
      erb :hello
    end
  end
end

