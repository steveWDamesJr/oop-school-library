$LOAD_PATH << '.'
require 'book'
require 'classroom'
require 'person'
require 'rental'
require 'services'
require 'student'
require 'teacher'

class App
  attr_accessor :user_input, :password

  def initialize
    puts 'Welcome to OOP School Library App!'
    Services.print_prompt
    @user_input = gets.chomp
    @default_classroom = Classroom.new('default-classroom')
    @people = []
    @books = []
    @rentals = []
  end
end
