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
end
