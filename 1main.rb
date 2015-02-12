require "sinatra"
require "sqlite3"
require "pry"
require_relative 'database_setup.rb'

require_relative 'item.rb'
require_relative 'category.rb'
require_relative 'location.rb'

get '/' do
  erb :homepage
end

get "/add" do 
  erb :add
end

get "/add_product_results" do

  @item = Item.new(params["item_name"], params["item_cat"], params["item_loc"], params["item_quant"], params["item_price"], params["item_desc"])
  @item.insert
  erb :add_product_results
end

get "/delete" do
  @list_items =Items.list_item_details_erb
  erb :delete
end

get "/delete_product_confirm" do
  Item.delete(params["value"].to_i)
  
  erb :delete_product_confirm
end

get "/edit" do

  erb :edit
end

get "/edit_product_confirm" do
  Item.editpwd(params["value"])
  
  erb :delete_product_confirm
end



# params = Item.new(item_name, item_cat, item_loc, item_quant, item_price, item_desc)

