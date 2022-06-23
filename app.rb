$LOAD_PATH << '.'
require 'book'
require 'classroom'
require 'person'
require 'rental'
require 'services'
require 'student'
require 'teacher'
require 'books_controller'
require 'people_controller'
require 'rentals_controller'
require 'json'
require './data'

class App
  attr_accessor :user_input, :password

  def initialize
    puts 'Welcome to OOP School Library App!'
    Services.print_prompt
    @user_input = gets.chomp
    @default_classroom = Classroom.new('default-classroom')
    @people_controller = PeopleController.new
    @books_controller = BooksController.new
    @rentals_controller = RentalsController.new
  end

  def start
    run
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, @default_classroom, name, parent_permission: parent_permission)
    @assign_people = @people_controller.all_people
    @assign_people << student
    puts student
    write_people(student)
    puts 'Student created successfully!'
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name)
    @assign_people = @people_controller.all_people
    @assign_people << teacher
    write_people(teacher)
    puts 'Teacher created successfully!'
  end

  def book_select
    puts "\nSelect a book from the following list by number "
    @books_controller.all_books_list
    book_select_index = gets.chomp
    (0...@books_controller.books.length).include?(book_select_index.to_i) ? book_select_index.to_i : book_select
  end

  def person_select
    puts "\nSelect a person from the following list by number "
    @people_controller.all_people_list
    person_select_index = gets.chomp
    (0...@people_controller.people.length).include?(person_select_index.to_i) ? person_select_index.to_i : person_select
  end

  def date_input
    print "\nDate:[yyyy/mm/dd] "
    gets.chomp
  end

  def create_rental
    return print 'Please add a book first' if @books_controller.books.empty?
    return print 'Please add a person first' if @people_controller.people.empty?

    book = @books_controller.books[book_select]
    person = @people_controller.people[person_select]
    date = date_input
    rental = Rental.new(date, person, book)
    @our_rentals = @rentals_controller.all_rentals
    @our_rentals << rental
    write_rental(rental)
    puts 'Rental created successfully!'
  end
end
