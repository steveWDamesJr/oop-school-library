$LOAD_PATH << '.'
require 'spec_helper'

describe Rental do
  it 'Create a new rental' do
    @new_teacher = Teacher.new(55, @specialization, 'Rubith')
    @new_book = Book.new('The Great Book', 'The Awesome Author')
    @new_rental = Rental.new('2022/10/02', @new_teacher, @new_book)
    expect(@new_rental.person.name).to eq('Rubith')
    expect(@new_rental.book.author).to eq('The Awesome Author')
  end

  it 'return newly added person when people= method is called' do
    @new_person = Person.new(55, 'Rubith')
    @new_book = Book.new('The Great Book', 'The Awesome Author')
    @new_rental = Rental.new('2022/10/02', @new_person, @new_book)
    expect(@new_rental.person = (@new_person)).to eql(@new_person)
  end

  it 'return newly added book when book= method is called' do
    @new_person = Person.new(55, 'Rubith')
    @new_book = Book.new('The Great Book', 'The Awesome Author')
    @new_rental = Rental.new('2022/10/02', @new_person, @new_book)
    expect(@new_rental.person = (@new_book)).to eql(@new_book)
  end
end
