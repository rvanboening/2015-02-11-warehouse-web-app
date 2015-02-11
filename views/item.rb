# Class: Item
#
# Creates items for the database.
#
# #Attributes:
# @item_name  - String: name of item
# @item_cat   - String: name of cateogry- Fruit or Vegetable.
# @item_loc   - String: name of location of store - Benson, Dundee, Downtown
# @item_quant - Integer: number of producs in inventory
# @item_price - Integer: cost of single item.
# @item_desc  - String: description of item
#
# Public Methods:
# # insert
# # delete
# # list_items
# # list_item_details
# # fetch_item_by


class Item
  attr_accessor :item_name, :item_cat, :item_loc, :item_quant, :item_price, :item_desc
  
  def initialize(item_name,item_cat,item_loc,item_quant,item_price,item_desc)
    @item_name = item_name
    @item_cat = item_cat
    @item_loc = item_loc
    @item_quant = item_quant
    @item_price = item_price
    @item_desc = item_desc
  end
  
#Public: #insert  
#  
  def insert
    attributes = []
    instance_variables.each { |i|
      attributes << i.to_s.delete("@")
    }
    
    query_components_array = []
    attributes.each { |x|
      value = self.send(x)
      
      if value.is_a?(Integer)
        query_components_array << "#{value}"
      else
        query_components_array << "'#{value}'"
      end
    }
    
    query_string = query_components_array.join(", ")
    puts query_string
    
    DATABASE.execute("INSERT INTO items (name, category, location, quantity, cost, description) VALUES (#{query_string})")  
    
    puts "Inserted successfully!"  
  end
  
  #DELETE Method
  def self.delete(value)
    
    if value.is_a?(Integer) 
      DATABASE.execute("DELETE FROM items WHERE id = #{value}")
    else
      DATABASE.execute("o")
    end
  end
  
  #lists all items name and details
  def self.list_items
    list = DATABASE.execute("SELECT id, name FROM items")
  end
  
  #list all items information
  def self.list_item_details
      DATABASE.execute("SELECT * FROM items")
  end
  
  def self.fetch_item_by(input,num)
    if num == 1
      DATABASE.execute("Select * FROM items WHERE id = #{input}")
    elsif num == 2
      DATABASE.execute("Select * FROM items WHERE name = '#{input}'")
    elsif num == 3
      DATABASE.execute("Select * FROM items WHERE category = '#{input}'")
    else num == 4
      DATABASE.execute("Select * FROM items WHERE location = '#{input}'")
    end
  end
  
  def self.edit(item_name, item_cat, item_loc, item_quant, item_price, item_desc, input)
    if input.is_a?(Integer)
      DATABASE.execute("UPDATE items SET name ='#{item_name}', category = '#{item_cat}', location = '#{item_loc}', 
      quantity = #{item_quant}, cost = #{item_price}, description = '#{item_desc}' WHERE id = #{input}")
    else
      DATABASE.execute("UPDATE items SET name ='#{item_name}', category = '#{item_cat}', location = '#{item_loc}', 
      quantity = #{item_quant}, cost  = #{item_price}, description = '#{item_desc}' WHERE name = '#{input}'")
    end
  end 

  
end