$LOAD_PATH << '.'
require 'spec_helper'

describe Book do
  it 'Create a new book' do
    @new_book = Book.new('The Great Book', 'The Awesome Author')
    expect(@new_book.title).to eq('The Great Book')
    expect(@new_book.author).to eq('The Awesome Author')
  end
end
