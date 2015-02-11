class Menu
  
  def self.launch
    loop do
      puts "What do you want to do.", "1. Add", "2. Delete", "3. Fetch", "4. Edit"
      @action = gets.chomp.to_i
      break if [1,2,3,4].include? @action
    end
  
    action_items= ["Add", "Delete", "Fetch", "Edit"]
    @action_text = action_items[@action-1]

    # @action_text= "Add" if @action == 1
    # @action_text= "Delete" if @action == 2
    # @action_text= "Fetch" if @action == 3
    # @action_text= "Edit" if @action == 4
    

       #if you select Fetch
       
       if @action == 3
         loop do
            puts "#{@action_text} by...", "1. Product ID", "2. Product Name", "3. Category", "4. Location"
            @fetch = gets.chomp.to_i
            break if [1,2,3,4].include? @fetch
          end
          
        elsif @action == 4
           @pcl_text = "Product"
             # puts "#{@action_text} by...", "1. Product ID", "2. Product Name"
             # @edit_by = gets.chomp.to_i  
        else
          #if you select 1 or 2
          loop do
             puts "#{@action_text}...", "1. Product", "2. Category", "3. Location"
             @pcl = gets.chomp.to_i
             break if [1,2,3].include? @pcl
           end
           pcl_items = ["Item", "Category", "Location"]
           @pcl_text= pcl_items[@pcl-1]
         end
         
    
     
    # @pcl_text= "Item" if @pcl == 1
    # @pcl_text= "Category" if @pcl == 2
    # @pcl_text= "Location" if @pcl == 3


    #add Product
    if @action == 1
      if @pcl== 1
        puts "Enter item name"
        item_name=gets.chomp
        puts "Enter item category."
        item_cat=gets.chomp
        puts "Enter item location."
        item_loc=gets.chomp
        puts "Enter item quanity."
        item_quant=gets.chomp.to_i
        puts "Enter item price." 
        item_price=gets.chomp.to_f
        puts "Enter a description"
        item_desc=gets.chomp
        
        new_item = Item.new(item_name, item_cat, item_loc, item_quant, item_price, item_desc)
        new_item.insert
    
      end
    
      #add category
      if @pcl == 2
        puts "#{@action_text} category."
        cat_name=gets.chomp
        
        Category.add(cat_name)
        
        puts "Category added successfully!"
        
      end
    
      #add Location
      if @pcl == 3
        puts "#{@action_text} location."
        loc_name=gets.chomp
        
        Location.add(loc_name)
        puts "Location added successfully!"
      end 
    end  
  
    #Delete Item
    if @action == 2
      if @pcl == 1
        puts "List of items:", 
        Item.list_items
        
        id, name = action_by
        
        Menu.delete(Item, id=nil, name=nil)
        # if id
        #   Item.delete(id)
        #   puts "This item has been deleted successfully."
        # else
        #   Item.delete(name)
        #   puts "This item has been deleted successfully."
        # end
      end 

      #Delete Category
      if @pcl == 2
        puts "List of Categories:",Category.list_cats
        id, name = action_by
        
        Menu.delete(Category, id=nil, name=nil)
      end
    
      #Delete Location
      if @fetch == 3
        puts "List of Locations:", Location.list_loc
        id, name = action_by
        
         Menu.delete(Location, id=nil, name=nil)
        
      end
    end
  
    #Fetch Product Id
    if @action == 3
      if @fetch == 1
        puts "Enter product ID:"
        id=gets.chomp.to_i
        puts Item.fetch_item_by(id,1)
      end 
   
      #Fetch product Name
      if @fetch == 2
        puts "Enter product name:"
        name=gets.chomp
        puts Item.fetch_item_by(name,2)
      end
    
      #Fetch product Category
      if @fetch == 3
        puts "Enter category:"
        cat=gets.chomp
        puts Item.fetch_item_by(cat,3)
      end
      
      #Fetch product Location
      if @fetch == 4
        puts "Enter lcoation:"
        loc=gets.chomp
        puts Item.fetch_item_by(loc,4)
        
      end
    end  
  
    #Edit by product id
    if @action == 4
      id, name = action_by 
      if id
        puts Item.fetch_item_by(id,1)
      else
        puts Item.fetch_item_by(name,2)
      end
      
      puts "Enter item name"
      item_name=gets.chomp
      puts "Enter item category."
      item_cat=gets.chomp
      puts "Enter item location."
      item_loc=gets.chomp
      puts "Enter item quanity."
      item_quant=gets.chomp.to_i
      puts "Enter item price." 
      item_price=gets.chomp.to_f
      puts "Enter a description"
      item_desc=gets.chomp
     
      #edit id
      if id
        Item.edit(item_name, item_cat, item_loc, item_quant, item_price, item_desc, id)
        puts "Product edited successfully!"
      else
        Item.edit(item_name, item_cat, item_loc, item_quant, item_price, item_desc, name)
        puts "Product edited successfully!"
      end  
    end
  end
  
  def self.action_by
      puts " #{@action_text} #{@pcl_text} by..",  "1. ID", "2. Name"
      by = gets.chomp.to_i
    if by == 1
      puts "Enter #{@pcl_text} id"
      id = gets.chomp.to_i
    else
      puts "Enter #{@pcl_text} name."
      name=gets.chomp
    end 
  
    return id, name
  end
  
  #Delete Method
  def self.delete(pcl,id,name)
    if id
      pcl.delete(id)
      puts "This #{pcl.name} has been deleted successfully."
    else
      pcl.delete(name)
      puts "This #{pcl.name} has been deleted successfully."
    end
  end
end  


  

  


  