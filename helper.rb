module Helper

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
      DATABASE.execute("Select * FROM items")
    elsif num == 2
      DATABASE.execute("Select * FROM categories")
    elsif num == 3
      DATABASE.execute("Select * FROM locations")
    end
  end
end