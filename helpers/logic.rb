module Logic

  #Public: fetch_item_by
  # Selects a record of information from a table
  #
  # Parameters:
  # number choosen by user
  #
  # Returns:
  # an Array of hashes containing all of the table information
  #
  # State Changes:
  # NA

  def fetch_item_by(num)
    if num == 1
      DATABASE.execute("SELECT * FROM items")
    elsif num == 2
      DATABASE.execute("SELECT * FROM categories")
    elsif num == 3
      DATABASE.execute("SELECT * FROM locations")
    end
  end
end

# Public: table_name
# Sets a variable to the table name
#
# Parameters:
# num - number choosen by user
#
# Returns:
# a string of the table name
#
# State Changes:
# NA

def table_name(num)
  if num == 1
    @table_name="Items"
  elsif num == 2
    @table_name="Categories"
  elsif num == 3
    @table_name="Locations"
  end
end
