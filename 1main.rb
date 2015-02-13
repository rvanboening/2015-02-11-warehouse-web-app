
require "sinatra"
require "sqlite3"
require "pry"

require_relative 'database_setup.rb'
require_relative 'item.rb'
require_relative 'category.rb'
require_relative 'location.rb'

require_relative "helper.rb"

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
  @list_item=Item.list_item_details
  erb :delete
end

get "/delete_product_confirm" do
  Item.delete(params["value"].to_i)
  
  erb :delete_product_confirm
end

get "/edit" do
  @list_item=Item.list_item_details
  erb :edit
end

get "/edit_choose_id" do
  @item_edit = Item.fetch_item_by(params["id"].to_i,1)
 erb :edit_choose_id
end

get "/edit_product_results" do
  @item=Item.edit(params["item_name"], params["item_cat"], params["item_loc"], params["item_quant"].to_i, params["item_price"].to_f, params["item_desc"], params["id"].to_i)
  erb :edit_product_results
end

get "/fetch" do
  fetch_item_by(params)
  erb :fetch
end

get "/fetch_choose" do 
  erb :fetch_choose
end