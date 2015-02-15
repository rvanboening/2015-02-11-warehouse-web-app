require_relative 'main.rb'

class Items

  def initalize(item_name, item_cat, item_loc, item_quant, item_price, item_desc)
    @item_name = item_name
    @item_cat = item_cat
    @item_loc =item_loc
    @item_quant = item_quant
    @item_price = item_price
    @item_desc = item_desc
  end
  
  def insert
    attributes = []
    
    instance_variables.each do |i|
      attributes << i.to_s.delete("@") 
    
      query_compenents_array = []
      
      attributes.each do |a|
        value = self.send(a)
        
        if value.is_a?(Integer)
          query_components_array << "#{a} = #{value}"
        else
          query_components_array << "#{a} = '#{value}'"
        end
        
        query_string = query_compnents_array.join(", ")

        DATABASE.execture("UPDATE items FROM farmyard ")
  end
  
  def self.list_items
      DATABASE.execute("SELECT id, name FROM item")
    end

    def self.list_item_details
        DATABASE.execute("SELECT * FROM item")
      end
end

