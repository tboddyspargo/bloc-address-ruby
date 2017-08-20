require_relative "entry"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry name, phone_number, email
    @entries.push(Entry.new(name, phone_number, email))
    @entries.sort!
  end
end
