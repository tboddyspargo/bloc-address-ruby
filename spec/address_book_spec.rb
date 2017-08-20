require_relative '../models/address_book'

 RSpec.describe AddressBook do
   describe "attributes" do
     let(:book) { AddressBook.new() }
     it "responds to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end

     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
     end
   end
   describe "#add_entry" do
     before :all do
       @book = AddressBook.new()
       @book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
     end

     it "adds only one entry to the address book" do
       expect(@book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       new_entry = @book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#remove_entry" do
     before :all do
       @book = AddressBook.new
       @book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       @book.add_entry('Theresa Lovelace', '010.012.1816', 'theresa.queen@lovelace.com')
     end

     it "removes only one entry from the address book" do
       @book.remove_entry 'Theresa Lovelace', '010.012.1816', 'theresa.queen@lovelace.com'
       expect(@book.entries.size).to eq(1)
     end

     it "removes the correct entry from the address book" do
       @book.add_entry('Mark Lovelace', '010.012.1817', 'mark.prince@lovelace.com')
       mark = @book.entries.select { |item| item.name === "Mark lovelace"}
       @book.remove_entry('Mark Lovelace', '010.012.1817', 'mark.prince@lovelace.com')
       expect(@book.entries).not_to include(mark)
     end
   end
 end
