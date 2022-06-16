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

  def users_input_valid?(user_input, arr)
    arr.include?(user_input)
  end

  def student_data
    age = Services.age_input
    name = Services.name_input
    has_parent_permission = Services.user_has_permission == 'Y'
    [age, name, has_parent_permission]
  end

  def teacher_data
    age = Services.age_input
    name = Services.name_input
    specialization = Services.specialization_input
    [age, name, specialization]
  end

  def create_person
    print "\nDo you want to create a student (1) or a teacher (2)?[Input the number]: "
    @user_input = gets.chomp.to_s
    create_person unless users_input_valid?(user_input, %w[1 2])
    if @user_input == '1'
      age, name, has_parent_permission = student_data
      person = Student.new(age, @default_classroom, name, parent_permission: has_parent_permission)
    else
      age, name, specialization = teacher_data
      person = Teacher.new(age, specialization, name)
    end

    @people << person
    puts 'Person created successfully!'
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
    puts 'Bingo! Book created successfully!'
  end

  def all_books_list
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", by Author: \"#{book.author}\"" }
  end

  def all_people_list
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Age: #{person.age} ID: #{person.id} Name: #{person.name}}"
    end
  end

  def book_select
    puts "\nSelect a book from the following list by number "
    all_books_list
    book_select_index = gets.chomp
    (0...@books.length).include?(book_select_index.to_i) ? book_select_index.to_i : book_select
  end

  def person_select
    puts "\nSelect a person from the following list by number "
    all_people_list
    person_select_index = gets.chomp
    (0...@people.length).include?(person_select_index.to_i) ? person_select_index.to_i : person_select
  end

  def date_input
    print "\nDate: "
    gets.chomp
  end

  def create_rental
    return print 'Please add a book first' if @books.empty?
    return print 'Please add a person first' if @people.empty?

    book = @books[book_select]
    person = @people[person_select]
    date = date_input
    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully!'
  end
end
