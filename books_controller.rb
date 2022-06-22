require 'json'
require './data'

class BooksController
  attr_reader :books

  def initialize
    @books = read_books
  end

  def title_input
    print 'Title: '
    title = gets.chomp
    title.empty? ? title_input : title
  end

  def author_input
    print 'Author: '
    author = gets.chomp
    author.empty? ? author_input : author
  end

  def create_book
    title = title_input
    author = author_input
    book = Book.new(title, author)
    @books << book
    write_books(book)
    puts 'Bingo! Book created successfully!'
  end

  def all_books_list
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", by Author: \"#{book.author}\"" }
  end
end
