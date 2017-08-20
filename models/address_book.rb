require_relative "entry"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry name, phone_number, email
    @entries.push(Entry.new(name, phone_number, email))
    @entries.sort! { |item1, item2| item1.name <=> item2.name }
  end

  def remove_entry name, phone_number, email
    @entries.reject! do |item|
      item.name === name && item.phone_number === phone_number && item.email === email
    end
  end
end
