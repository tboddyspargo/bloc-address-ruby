require_relative '../models/address_book'

 RSpec.describe AddressBook do
   let(:book) { AddressBook.new }

   def check_entry entry, expected_name, expected_number, expected_email
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   describe "attributes" do
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

     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       check_entry book.entries[0], 'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com'
     end
   end

   describe "#import_from_csv" do
     before do
       book.import_from_csv "entries.csv"
     end

     it "imports the correct number of entries" do
       expect(book.entries.size).to eq(5)
     end

     it "imports the 1st entry" do
       check_entry book.entries[0], "Bill", "555-555-4854", "bill@blocmail.com"
     end

     it "imports the 2nd entry" do
       check_entry book.entries[1], "Bob", "555-555-5415", "bob@blocmail.com"
     end

     it "imports the 3rd entry" do
       check_entry book.entries[2], "Joe", "555-555-3660", "joe@blocmail.com"
     end

     it "imports the 4th entry" do
       check_entry book.entries[3], "Sally", "555-555-4646", "sally@blocmail.com"
     end

     it "imports the 5th entry" do
       check_entry book.entries[4], "Sussie", "555-555-2036", "sussie@blocmail.com"
     end
   end

   describe "#import_from_csv_2" do
     before do
       book.import_from_csv "entries_2.csv"
     end

     it "imports the correct number of entries" do
       expect(book.entries.size).to eq(3)
     end

     it "imports the 1st entry" do
       check_entry book.entries[0], "Arya", "555-555-4209", "arya@blocmail.com"
     end

     it "imports the 2nd entry" do
       check_entry book.entries[1], "Bran", "555-555-6183", "bran@blocmail.com"
     end

     it "imports the 3rd entry" do
       check_entry book.entries[2], "John", "555-555-0923", "john@blocmail.com"
     end
   end
 end
