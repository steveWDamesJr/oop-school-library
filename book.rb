$LOAD_PATH << '.'
require 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'title' => @title,
      'author' => @author
    }
  end
end
