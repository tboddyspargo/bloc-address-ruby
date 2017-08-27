require_relative "entry"
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  # Add a contact to AddressBook
  def add_entry name, phone_number, email
    @entries.push(Entry.new name, phone_number, email)
    @entries.sort! { |item1, item2| item1.name <=> item2.name }
  end

  # Import contacts from a CSV formatted file.
  def import_from_csv file_name
    csv_text = File.read file_name
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry row_hash["name"], row_hash["phone_number"], row_hash["email"]
    end
  end

  # Search AddressBook for a specific entry by name.
  def binary_search name

    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name === mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

    return nil
  end

  def iterative_search name
    entries.each do |item|
      return item if item.name === name
    end
    return nil
  end

end
