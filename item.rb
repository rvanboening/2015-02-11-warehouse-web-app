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
  
  extend Logic
  
  attr_accessor :item_name, :item_cat, :item_loc, :item_quant, :item_price, :item_desc
  attr_reader :id 
  
  
  def initialize(item_name,item_cat,item_loc,item_quant,item_price,item_desc)
    @item_name = item_name
    @item_cat = item_cat
    @item_loc = item_loc
    @item_quant = item_quant
    @item_price = item_price
    @item_desc = item_desc
  end
  
#Public: #insert  
#  Inserts a new array of peramiters into the items table. 
# 
# Parameters:
# item_name  - Item name
# item_cat   - Item category
# item_loc   - Item location
# item_quant - item Quantity
# item_price - item cost
# item_desc  - item description
# 
# Returns:
# String - Inserted successfully

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
    @id = DATABASE.last_insert_row_id
    puts "Inserted successfully!"  
  end
  
  # Public: #delete
  # Deletes a record of information
  #
  # Parameters:
  # item_id - id integer of the item
  #
  # Returns:
  # NA
  #
  # State Changes: 
  # Deletes a record of infromation. 
  
  #DELETE Method
  def self.delete(value)
    
    if value.is_a?(Integer) 
      DATABASE.execute("DELETE FROM items WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM items WHERE name = '#{value}'")
    end
  end
  
  # Public: #list_item
  # Lists item id and name of a record
  #
  # Parameters:
  # id - Item ID
  #
  # Returns:
  # an arrary of hashes containing the item id and name
  #
  # State Changes: 
  # no changes
   
  #lists all items name and details
  def self.list_items
    list = DATABASE.execute("SELECT id, name FROM items")
  end
  
  # Public: #list_item
  # Lists all item record details
  #
  # Parameters:
  # id - Item ID
  #
  # Returns:
  # an arrary of hashes
  #
  # State Changes: 
  # no changes
  
  #list all items information
  def self.list_item_details
      DATABASE.execute("SELECT * FROM items")
  end

  # Public: #fetch_item_id
  # Selects all record details 
  #
  # Parameters:
  # id       - Item ID
  # name     - Item Name
  # category - Item Category
  # location - Item Location
  #
  # Returns:
  # an arrary of hashes where all of the 
  #
  # State Changes: 
  # no changes

        # def self.fetch_item_by(input,num)
        #   if num == 1
        #     DATABASE.execute("Select * FROM items WHERE id = #{input}")
        #   elsif num == 2
        #     DATABASE.execute("Select * FROM items WHERE name = '#{input}'")
        #   elsif num == 3
        #     DATABASE.execute("Select * FROM items WHERE category = '#{input}'")
        #   else num == 4
        #     DATABASE.execute("Select * FROM items WHERE location = '#{input}'")
        #   end
        # end
  
  # Public: #edit
  # collects id of record and replaces it with new 
  #
  # Parameters:
  # id       - Item ID
  # item_name  - Item name
  # item_cat   - Item category
  # item_loc   - Item location
  # item_quant - item Quantity
  # item_price - item cost
  # item_desc  - item description
  #
  # Returns:
  # NA
  #
  # State Changes: 
  # record id is changed 
  
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