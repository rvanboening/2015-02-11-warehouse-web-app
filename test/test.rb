require 'pry'
require 'sqlite3'
# require_relative '2015-02-11-warehouse-web-app/1main.rb'



class Test
  
  def test_insert
    options = ({"name" => "Watermellon", "category" => "Fruit", 'location' => "Benson", 'quantity' => 20, 'cost' => 5.00, "description" => "Green"})
    test1 = Item.new
    test1.insert(options)
  end
end

binding.pry

  