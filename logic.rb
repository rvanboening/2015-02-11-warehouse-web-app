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