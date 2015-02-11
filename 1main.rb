require "sinatra"


get '/' do
  erb :homepage
end

get "/add" do 
  erb :add
end

get "/add_product_results" do
  @add_product_results=(params)
  erb :add_product_results
end


# params = Item.new(item_name, item_cat, item_loc, item_quant, item_price, item_desc)

