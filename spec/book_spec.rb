$LOAD_PATH << '.'
require 'spec_helper'

describe Book do
  it 'Create a new book' do
    @new_book = Book.new('The Great Book', 'The Awesome Author')
    expect(@new_book.title).to eq('The Great Book')
    expect(@new_book.author).to eq('The Awesome Author')
  end

  it 'Return a book rental via add_rental method' do
    book = Book.new('Great Book', 'Great Author')
    person = Person.new(22, 'Levy', paren t_permission: false)
    rental = Rental.new('2022/06/16', person, book)

    person.add_rental(rental)

    expect(book.rentals).to eql [rental]
  end
end
