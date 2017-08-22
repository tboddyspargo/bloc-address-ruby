require_relative "entry"
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry name, phone_number, email
    @entries.push(Entry.new name, phone_number, email)
    @entries.sort! { |item1, item2| item1.name <=> item2.name }
  end

  def import_from_csv file_name
    csv_text = File.read file_name
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry row_hash["name"], row_hash["phone_number"], row_hash["email"]
    end
  end
end
