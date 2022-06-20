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

  def users_input_valid?(user_input, arr)
    arr.include?(user_input)
  end

  def create_person
    print "\nDo you want to create a student (1) or a teacher (2)?[Input the number]: "
    @user_input = gets.chomp.to_s
    create_person unless users_input_valid?(user_input, %w[1 2])
    if @user_input == '1'
      age, name, has_parent_permission = @people_controller.student_data
      person = Student.new(age, @default_classroom, name, parent_permission: has_parent_permission)
    else
      age, name, specialization = @people_controller.teacher_data
      person = Teacher.new(age, specialization, name)
    end

    @assign_people = @people_controller.all_people
    @assign_people << person
    puts 'Person created successfully!'
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
    print "\nDate: "
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
    puts 'Rental created successfully!'
  end

  def create_selections_for_user(user_input)
    case user_input
    when '3'
      create_person
    when '4'
      @books_controller.create_book
    when '5'
      create_rental
    end
  end

  def display_selections_for_user(user_input)
    case user_input
    when '1'
      @books_controller.all_books_list
    when '2'
      @people_controller.all_people_list
    when '6'
      all_people1 = @people_controller.all_people
      @rentals_controller.all_rentals_list_by_id(all_people1)
    end
  end

  def run
    loop do
      case user_input
      when '3', '4', '5'
        create_selections_for_user(user_input)
      when '1', '2', '6'
        display_selections_for_user(user_input)
      when '7'
        puts 'Thanks for interacting with OOP School Library App. Bye Bye!'
        exit(true)
      else
        puts "\nInvalid input \" #{user_input}\"!"
        puts 'Please try selecting from the following options: '
        Services.print_prompt
        @user_input = gets.chomp
        run
      end
      Services.print_prompt
      @user_input = gets.chomp
    end
  end
end
